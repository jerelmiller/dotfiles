local mod_hl = require('user.utils').mod_hl
local nord0_gui = '#2E3440'
local nord1_gui = '#3B4252'
local nord2_gui = '#434C5E'
local nord3_gui = '#4C566A'
local nord3_gui_bright = '#616E88'
local nord4_gui = '#D8DEE9'
local nord5_gui = '#E5E9F0'
local nord6_gui = '#ECEFF4'
local nord7_gui = '#8FBCBB'
local nord8_gui = '#88C0D0'
local nord9_gui = '#81A1C1'
local nord10_gui = '#5E81AC'
local nord11_gui = '#BF616A'
local nord12_gui = '#D08770'
local nord13_gui = '#EBCB8B'
local nord14_gui = '#A3BE8C'
local nord15_gui = '#B48EAD'

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
