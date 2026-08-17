return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    local neotest = require("neotest")

    -- Workspace-local Jest settings, same source as VS Code's jest.jestCommandLine.
    -- Extra args go through jestArguments: neotest-jest splits jestCommand on
    -- whitespace and would break quoted --ignoreProjects values.

    local function project_root(path)
      return vim.fs.root(path, { ".git", ".vscode" })
        or vim.fs.root(path, "package.json")
        or vim.fn.getcwd()
    end

    local function read_jsonc(path)
      local ok, lines = pcall(vim.fn.readfile, path)
      if not ok then
        return nil
      end

      local text = table.concat(lines, "\n")
      text = text:gsub("/%*.-%*/", "")
      text = text:gsub("//[^\n]*", "")
      text = text:gsub(",%s*([}%]])", "%1")

      local decoded_ok, decoded = pcall(vim.json.decode, text)
      if not decoded_ok then
        vim.notify("Failed to parse " .. path, vim.log.levels.WARN)
        return nil
      end

      return decoded
    end

    local function split_command(cmd)
      local args = {}
      local current = {}
      local quote

      for i = 1, #cmd do
        local c = cmd:sub(i, i)
        if quote then
          if c == quote then
            quote = nil
          else
            current[#current + 1] = c
          end
        elseif c == "'" or c == '"' then
          quote = c
        elseif c:match("%s") then
          if #current > 0 then
            args[#args + 1] = table.concat(current)
            current = {}
          end
        else
          current[#current + 1] = c
        end
      end

      if #current > 0 then
        args[#args + 1] = table.concat(current)
      end

      return args
    end

    local function is_jest_binary(arg)
      return arg == "jest" or arg:match("[/\\]jest$") or arg:match("[/\\]jest%.js$")
    end

    local function resolve_token(root, token)
      if token:match("^%./") or token:match("^node_modules/") then
        return vim.fs.joinpath(root, token)
      end
      return token
    end

    local function parse_vscode_jest(root, cmdline)
      local tokens = split_command(cmdline)
      local binary_end = 0

      for i, token in ipairs(tokens) do
        tokens[i] = resolve_token(root, token)
        if is_jest_binary(tokens[i]) then
          binary_end = i
        end
      end

      if binary_end == 0 then
        return {
          binary = table.concat(tokens, " "),
          extra = {},
          config = nil,
        }
      end

      local extra = {}
      local config
      local i = binary_end + 1

      while i <= #tokens do
        local arg = tokens[i]
        if arg == "--config" then
          config = tokens[i + 1]
          i = i + 2
        elseif arg:match("^%-%-config=") then
          config = arg:match("^%-%-config=(.*)")
          i = i + 1
        else
          extra[#extra + 1] = arg
          i = i + 1
        end
      end

      if config then
        if not vim.startswith(config, "/") then
          config = vim.fs.joinpath(root, config)
        end
        config = vim.fs.normalize(config)
      end

      return {
        binary = table.concat(vim.list_slice(tokens, 1, binary_end), " "),
        extra = extra,
        config = config,
      }
    end

    local function vscode_jest_for(path)
      local root = project_root(path)
      local settings_path = vim.fs.joinpath(root, ".vscode", "settings.json")
      if vim.fn.filereadable(settings_path) == 0 then
        return nil
      end

      local settings = read_jsonc(settings_path)
      local cmdline = settings and settings["jest.jestCommandLine"]
      if type(cmdline) ~= "string" or cmdline == "" then
        return nil
      end

      return parse_vscode_jest(root, cmdline)
    end

    ---@diagnostic disable-next-line: missing-fields
    neotest.setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = function(path)
            local vs = vscode_jest_for(path)
            if vs then
              return vs.binary
            end
            return "npm test --"
          end,
          jestConfigFile = function(path)
            local vs = vscode_jest_for(path)
            if vs and vs.config then
              return vs.config
            end
            return require("neotest-jest.jest-util").getJestConfig(path)
              or "jest.config.js"
          end,
          jestArguments = function(default_arguments, context)
            local extras = {}
            if context.config then
              local vs = vscode_jest_for(context.config)
              if vs then
                extras = vs.extra
              end
            end
            return vim.list_extend(default_arguments, extras)
          end,
          cwd = function(path)
            return project_root(path)
          end,
          env = { CI = true },
        }),
      },
      ---@diagnostic disable-next-line: missing-fields
      discovery = {
        enabled = false,
      },
    })

    vim.keymap.set("n", "<leader>sf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Test file" })
    vim.keymap.set("n", "<leader>sl", function()
      neotest.run.run_last()
    end, { desc = "Test last" })
    vim.keymap.set("n", "<leader>sn", function()
      neotest.run.run()
    end, { desc = "Test nearest" })
    vim.keymap.set("n", "<leader>st", function()
      neotest.summary.toggle()
    end, { desc = "Toggle test summary" })
    vim.keymap.set("n", "<leader>so", function()
      neotest.output.open({ enter = true })
    end, { desc = "Open test output" })
    vim.keymap.set("n", "]s", function()
      neotest.jump.next()
    end, { desc = "Jump to next test" })
    vim.keymap.set("n", "[s", function()
      neotest.jump.prev()
    end, { desc = "Jump to previous test" })
    vim.keymap.set("n", "]x", function()
      neotest.jump.next({ status = "failed" })
    end, { desc = "Jump to next failed test" })
    vim.keymap.set("n", "[x", function()
      neotest.jump.prev({ status = "failed" })
    end, { desc = "Jump to previous failed test" })
  end,
}
