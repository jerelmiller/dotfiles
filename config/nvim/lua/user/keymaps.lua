local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true }

-- Alias common mistyped commands
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})

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
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)

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

-- Trouble
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
vim.keymap.set('n', "<leader>xd", '<cmd>TroubleToggle document_diagnostics<cr>', opts)

-- Telescope keymaps
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>t', builtin.find_files, { desc = '*deprecated*' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { desc = '[S]earch [G]it [C]ommits' })
vim.keymap.set('n', '<leader>sgb', builtin.git_branches, { desc = '[S]earch [G]it [B]ranches' })
vim.keymap.set('n', '<leader>sgs', builtin.git_stash, { desc = '[S]earch [G]it [S]tash' })
