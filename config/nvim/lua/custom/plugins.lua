local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "dockerfile-language-server",
        "eslint-lsp",
        "elixir-ls",
        "graphql-language-service-cli",
        "html-lsp",
        "js-debug-adapter",
        "prettier",
        "prettierd",
        "prisma-language-server",
        "lua-language-server",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  "williamboman/mason-lspconfig.nvim",
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = {
        "jose-elias-alvarez/typescript.nvim",
      },
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "dockerfile",
        "eex",
        "elixir",
        "erlang",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "regex",
        "ruby",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<Esc>"] = require("telescope.actions").close,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  { "alexghergh/nvim-tmux-navigation", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "tpope/vim-abolish", lazy = false },
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "folke/neodev.nvim",
    config = function()
      require "custom.configs.neodev"
    end,
  },
}

return plugins
