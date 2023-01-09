-- These must be set before the colorscheme is set
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

vim.cmd([[
  augroup nord-theme-overrides
    autocmd!

    " Remove background on diagnostic window
    autocmd ColorScheme nord highlight Pmenu guibg=NONE ctermbg=NONE
  augroup END
]])

vim.cmd([[colorscheme nord]])
