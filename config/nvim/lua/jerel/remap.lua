-- reminder: mapleader set in lazy.lua

local opts = { noremap = false, silent = true }

-- Alias common mistyped commands
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})

-- Use 0 to go to first character instead of beginning of line
vim.keymap.set('n', '0', '^', opts)

-- Navigate soft wrapped lines
-- TODO: Get this solution working: https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')

-- Textobjects
-- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

-- Make builtins repeatable
-- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
-- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
-- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
-- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)

-- Escape insert mode with 'jk'
vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.keymap.set('i', 'Jk', '<Esc>', opts)
vim.keymap.set('i', '<C-c>', '<Esc>', opts)

-- Remove highlight
vim.keymap.set('n', 'ch', ':noh<cr>', opts)

-- Use ctrl-h/j/k/l to move between splits
vim.keymap.set('n', '<C-h>', '<C-W>h', opts)
vim.keymap.set('n', '<C-j>', '<C-W>j', opts)
vim.keymap.set('n', '<C-k>', '<C-W>k', opts)
vim.keymap.set('n', '<C-l>', '<C-W>l', opts)

-- Resize with arrows
-- vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
-- vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
-- vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
-- vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)

-- Show code actions
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Refactoring
vim.keymap.set(
  'v',
  '<leader>rr',
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  opts
)
vim.keymap.set(
  'n',
  '<leader>rv',
  ":lua require('refactoring').debug.print_var({ normal = true })<CR>",
  { noremap = true }
)

-- Diagnostic keymaps
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Fugitive
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>', opts)
vim.keymap.set('n', '<leader>gd', ':Git diff<cr>', opts)
vim.keymap.set('n', '<leader>gs', ':Git<cr>', opts)
vim.keymap.set('n', '<leader>grm', ':GRemove<cr>', opts)

-- Nvim Tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<cr>', opts)
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<cr>', opts)
