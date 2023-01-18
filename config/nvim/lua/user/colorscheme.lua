local mod_hl = require('user.utils').mod_hl

-- These must be set before the colorscheme is set
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('nord-theme-overrides', { clear = true }),
  pattern = 'nord',
  callback = function()
    mod_hl('Pmenu', { bg = 'NONE' })
  end,
})

vim.cmd([[colorscheme nord]])
