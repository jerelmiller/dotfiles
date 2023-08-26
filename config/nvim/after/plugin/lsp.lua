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

