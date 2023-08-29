local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  sources = {
    -- formatting
    formatting.stylua,
    formatting.prettier,
    formatting.mix,

    -- code actions
    code_actions.refactoring,
    require('typescript.extensions.null-ls.code-actions'),
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(_)
              return client.name == 'null-ls'
            end,
          })
        end,
      })
    end
  end,
})
