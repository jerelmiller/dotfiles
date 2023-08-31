local ft = require('guard.filetype')

ft('lua'):fmt('stylua'):lint('luacheck')
ft('typescript,javascript,typescriptreact'):fmt('prettier')
ft('elixir'):fmt('mixformat')

require('guard').setup({
  fmt_on_save = true,
  lsp_as_default_formatter = false,
})
