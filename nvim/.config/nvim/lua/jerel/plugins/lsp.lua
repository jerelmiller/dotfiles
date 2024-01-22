return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("neodev").setup()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
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
          "stylelint_lsp",
          "tailwindcss",
          "taplo",
          "tsserver",
          "yamlls",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                  require("nvim-navic").attach(client, bufnr)
                end
              end,
              capabilities = capabilities,
              handlers = {
                ["textDocument/hover"] = vim.lsp.with(
                  vim.lsp.handlers.hover,
                  { border = "rounded" }
                ),
                ["textDocument/signatureHelp"] = vim.lsp.with(
                  vim.lsp.handlers.signature_help,
                  { border = "rounded" }
                ),
              },
            })
          end,
        },
      })
    end,
  },
}
