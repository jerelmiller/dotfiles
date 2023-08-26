local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup_servers({
  'cssls',
  'cssmodules_ls',
  'elixirls',
  'html',
  'graphql',
  'lua_ls',
  'tailwindcss',
  'tsserver',
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format(
        '[%s] %s (%s)',
        diagnostic.source,
        diagnostic.message,
        diagnostic.code
      )
    end,
  },
  float = {
    format = function(diagnostic)
      return string.format('[%s] %s', diagnostic.source, diagnostic.message)
    end,
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

vim.lsp.handlers['textDocument/signatureHelp'] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

require('lspconfig.ui.windows').default_options = {
  border = 'rounded',
}
