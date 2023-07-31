-- Alias common mistyped commands
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})

-- Use 0 to go to first character instead of beginning of line
vim.keymap.set('n', '0', '^')

-- Navigate soft wrapped lines
-- TODO: Get this solution working: https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')

-- Escape insert mode with 'jk'
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'Jk', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Remove highlight
vim.keymap.set('n', 'ch', ':noh<cr>')

-- Use ctrl-h/j/k/l to move between splits
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-l>', '<C-W>l')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')

-- Show code actions
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Diagnostic keymaps
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Special thanks to ThePrimeagen for the following commands
-- https://youtu.be/w7i4amO_zaE

-- Move selected blocks of text up/down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Keep cursor in position when using J
vim.keymap.set('n', 'J', "mzJ`z")

-- Keep cursor in middle of screen when moving page up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor in middle of screen when navigating between search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste but do not copy pasted over text into clipboard
vim.keymap.set('x', '<leader>p', '"_dp')

-- Copy text into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- When deleting pull text into different register
vim.keymap.set({'n','v'}, '<leader>d', '"_d')

-- Format text
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Replace word under cursor in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Source the current file
vim.keymap.set('n', '<leader><leader>', function() vim.cmd('so') end)
