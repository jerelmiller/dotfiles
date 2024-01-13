return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
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
          "remark_ls",
          "stylelint_lsp",
          "tailwindcss",
          "taplo",
          "tsserver",
          "yamlls"
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end
        }
      })
    end
  }
}
