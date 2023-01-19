local mod_hl = require('user.utils').mod_hl
local nord0 = '#2E3440'
local nord1 = '#3B4252'
local nord2 = '#434C5E'
local nord3 = '#4C566A'
local nord3_bright = '#616E88'
local nord4 = '#D8DEE9'
local nord5 = '#E5E9F0'
local nord6 = '#ECEFF4'
local nord7 = '#8FBCBB'
local nord8 = '#88C0D0'
local nord9 = '#81A1C1'
local nord10 = '#5E81AC'
local nord11 = '#BF616A'
local nord12 = '#D08770'
local nord13 = '#EBCB8B'
local nord14 = '#A3BE8C'
local nord15 = '#B48EAD'

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
    mod_hl('@text.uri', { italic = true, fg = nord8 })

    vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = nord7 })
    vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = nord9 })
    vim.api.nvim_set_hl(0, '@jsx.tag', { fg = nord9, bold = true })
    vim.api.nvim_set_hl(0, '@jsx.component', { fg = nord7 })
    vim.api.nvim_set_hl(0, '@jsx.delimiter', { link = '@tag.delimiter' })
  end,
})

vim.cmd([[colorscheme nord]])
