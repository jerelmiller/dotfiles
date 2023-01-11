local servers = {
  'cssls',
  'cssmodules_ls',
  'elixirls',
  'graphql',
  'sumneko_lua',
  'tsserver',
}

require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      capabilities = require('user.lsp.handlers').capabilities,
      on_attach = require('user.lsp.handlers').on_attach,
    }

    local require_ok, conf_opts =
      pcall(require, 'user.lsp.settings.' .. server_name)
    if require_ok then
      opts = vim.tbl_deep_extend('force', conf_opts, opts)
    end

    require('lspconfig')[server_name].setup(opts)
  end,
})
