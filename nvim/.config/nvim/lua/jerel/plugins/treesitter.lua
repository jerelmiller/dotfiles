return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
  },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    local ensure_installed = {
      "astro",
      "bash",
      "c",
      "css",
      "diff",
      "dockerfile",
      "elixir",
      "erlang",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "graphql",
      "heex",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      -- "jsonc",
      "jq",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "ruby",
      "rust",
      "scss",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }
    local already_installed = require("nvim-treesitter.config").get_installed()
    local parsers_to_install = vim
      .iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsers_to_install)

    ---@diagnostic disable-next-line: missing-fields
    -- require("nvim-treesitter").setup({
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_selection = "<C-space>",
    --       node_incremental = "<C-space>",
    --       scope_incremental = false,
    --       node_decremental = "<bs>",
    --     },
    --   },
    --   -- textobjects = {
    --   --   lsp_interop = {
    --   --     enable = true,
    --   --     border = "rounded",
    --   --     peek_definition_code = {
    --   --       ["<leader>df"] = "@function.outer",
    --   --       ["<leader>dc"] = "@class.outer",
    --   --     },
    --   --   },
    --   -- },
    -- })

    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local select = require("nvim-treesitter-textobjects.select")
    -- m == "method"
    vim.keymap.set({ "x", "o" }, "am", function()
      select.select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "im", function()
      select.select_textobject("@function.inner", "textobjects")
    end)

    -- = == "assignment"
    vim.keymap.set({ "x", "o" }, "a=", function()
      select.select_textobject("@assignment.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "i=", function()
      select.select_textobject("@assignment.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "l=", function()
      select.select_textobject("@assignment.lhs", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "r=", function()
      select.select_textobject("@assignment.rhs", "textobjects")
    end)

    -- f == "function call"
    vim.keymap.set({ "x", "o" }, "af", function()
      select.select_textobject("@call.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
      select.select_textobject("@call.inner", "textobjects")
    end)

    -- c == "class"
    vim.keymap.set({ "x", "o" }, "ac", function()
      select.select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ic", function()
      select.select_textobject("@class.inner", "textobjects")
    end)

    -- i == "if"
    vim.keymap.set({ "x", "o" }, "ai", function()
      select.select_textobject("@conditional.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ii", function()
      select.select_textobject("@conditional.inner", "textobjects")
    end)

    -- a == "argument"
    vim.keymap.set({ "x", "o" }, "aa", function()
      select.select_textobject("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ia", function()
      select.select_textobject("@parameter.inner", "textobjects")
    end)

    local swap = require("nvim-treesitter-textobjects.swap")
    vim.keymap.set("n", "<leader>na", function()
      swap.swap_next("@parameter.inner")
    end)
    vim.keymap.set("n", "<leader>pa", function()
      swap.swap_previous("@parameter.inner")
    end)
    vim.keymap.set("n", "<leader>nm", function()
      swap.swap_next("@parameter.outer")
    end)
    vim.keymap.set("n", "<leader>pm", function()
      swap.swap_previous("@parameter.inner")
    end)

    local move = require("nvim-treesitter-textobjects.move")
    vim.keymap.set({ "n", "x", "o" }, "]a", function()
      move.goto_next_start("@parameter.inner", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[a", function()
      move.goto_previous_start("@parameter.inner", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]A", function()
      move.goto_next_end("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[A", function()
      move.goto_previous_end("@parameter.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "]]", function()
      move.goto_next_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[]", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "][", function()
      move.goto_next_end("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[[", function()
      move.goto_previous_end("@class.outer", "textobjects")
    end)

    -- MDX
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
