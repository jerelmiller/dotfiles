return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local navic = require("nvim-navic")

      local function on_attach(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      -- clear=false: a new buffer must not remove other buffers' save hooks.
      local function create_fix_on_save_autocmd(name, bufnr, callback)
        local group = vim.api.nvim_create_augroup(name, { clear = false })

        vim.api.nvim_clear_autocmds({
          group = group,
          buffer = bufnr,
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          buffer = bufnr,
          callback = callback,
        })
      end

      local function eslint_fix_all(bufnr)
        local eslint = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })[1]
        if not eslint then
          return
        end

        -- LspEslintFixAll uses a 1s timeout and ignores failures.
        local _, err = eslint:request_sync("workspace/executeCommand", {
          command = "eslint.applyAllFixes",
          arguments = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              version = vim.lsp.util.buf_versions[bufnr],
            },
          },
        }, 5000, bufnr)

        if err then
          vim.notify("ESLint fix-on-save failed: " .. err, vim.log.levels.WARN)
        end
      end

      vim.lsp.config("*", {
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }),
        on_attach = on_attach,
      })

      local eslint_on_attach = vim.lsp.config.eslint.on_attach
      vim.lsp.config("eslint", {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          if eslint_on_attach then
            eslint_on_attach(client, bufnr)
          end

          create_fix_on_save_autocmd("JerelEslintFixOnSave", bufnr, function()
            eslint_fix_all(bufnr)
          end)
        end,
      })

      local oxlint_on_attach = vim.lsp.config.oxlint.on_attach
      vim.lsp.config("oxlint", {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          if oxlint_on_attach then
            oxlint_on_attach(client, bufnr)
          end

          -- create_fix_on_save_autocmd("JerelOxlintFixOnSave", bufnr, function()
          --   vim.cmd("LspOxlintFixAll")
          -- end)
        end,
      })
      vim.lsp.enable("oxlint")

      vim.lsp.config("tailwindcss", {
        settings = {
          tailwindCSS = {
            validate = true,
            classFunctions = { "cva", "cx", "clsx" },
          },
        },
      })

      vim.lsp.config("cspell_ls", {
        filetypes = {
          "css",
          "gitcommit",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "mdx",
          "typescript",
          "typescriptreact",
          "yaml",
        },
      })

      vim.api.nvim_create_user_command("CSpellDisable", function()
        vim.lsp.enable("cspell_ls", false)
      end, {
        desc = "Disable CSpell",
      })

      vim.api.nvim_create_user_command("CSpellEnable", function()
        vim.lsp.enable("cspell_ls", true)
      end, {
        desc = "Enable CSpell",
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.config("vtsls", {
        settings = {
          javascript = {
            preferences = {
              jsxAttributeCompletionStyle = "auto",
            },
          },
          typescript = {
            preferences = {
              jsxAttributeCompletionStyle = "auto",
            },
          },
        },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        -- ts_ls stays installed; exclude so it does not attach next to vtsls.
        -- To switch back: uncomment ts_ls, remove vtsls, drop the exclude.
        automatic_enable = {
          exclude = { "ts_ls" },
        },
        ensure_installed = {
          "astro",
          "bashls",
          "cspell_ls",
          "cssls",
          "cssmodules_ls",
          "dockerls",
          "elixirls",
          "eslint",
          "graphql",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "mdx_analyzer",
          "oxlint",
          "rust_analyzer",
          "stylelint_lsp",
          "tailwindcss",
          "taplo",
          -- "ts_ls",
          "vtsls",
          "yamlls",
        },
      })

      local buf_request_all_orig = vim.lsp.buf_request_all

      -- HACK: If an the lsp returns empty contents instead of nil, return nil
      -- instead to prevent multiple sources from showing up (looking at you
      -- GraphQL)
      -- Source: https://github.com/neovim/neovim/pull/33692#issuecomment-2849182972
      --
      ---@param bufnr integer Buffer handle
      ---@param method vim.lsp.protocol.Method.ClientToServer.Request LSP method name
      ---@param params? table | (fun(client: vim.lsp.Client, bufnr: integer): table?) Parameters to send to the server.
      ---@param handler lsp.MultiHandler Result handler
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.lsp.buf_request_all(bufnr, method, params, handler)
        if method == vim.lsp.protocol.Methods.textDocument_hover then
          local handler_orig = handler
          ---@type lsp.MultiHandler
          function handler(results, context)
            for _, resp in pairs(results) do
              --- @type lsp.Hover?
              local result = resp.result
              if result ~= nil then
                local contents = result.contents
                if
                  type(contents) ~= "string" and #vim.tbl_keys(contents) == 0
                then
                  resp.result = nil
                end
              end
            end
            return handler_orig(results, context)
          end
        end

        return buf_request_all_orig(bufnr, method, params, handler)
      end
    end,
  },
}
