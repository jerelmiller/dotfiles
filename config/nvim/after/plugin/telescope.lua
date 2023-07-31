local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { 'node_modules' },
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        -- ['<C-t>'] = trouble.open_with_trouble,
        ['<Esc>'] = actions.close,
      },
      n = {
        -- ['<C-t>'] = trouble.open_with_trouble,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {
	desc = '[F]ind [F]iles'
})

vim.keymap.set('n', '<leader>t', builtin.git_files, {
	desc = 'Git files'
})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {
  desc = '[P]roject [S]earch'
})

vim.keymap.set('n', '<leader>?', builtin.oldfiles, {
  desc = '[?] Find recently opened files',
})

vim.keymap.set('n', '<leader><space>', builtin.buffers, {
  desc = '[ ] Find existing buffers',
})

vim.keymap.set('n', '<leader>hl', builtin.highlights, {
  desc = 'Search [h]igh[l]ight groups',
})

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, {
  desc = '[/] Fuzzily search in current buffer]',
})

vim.keymap.set('n', '<leader>sh', builtin.help_tags, {
  desc = '[S]earch [H]elp',
})

vim.keymap.set('n', '<leader>sw', builtin.grep_string, {
  desc = '[S]earch current [W]ord',
})

vim.keymap.set('n', '<leader>sg', builtin.live_grep, {
  desc = '[S]earch by [G]rep',
})

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {
  desc = '[S]earch [D]iagnostics',
})

vim.keymap.set('n', '<leader>sgc', builtin.git_commits, {
  desc = '[S]earch [G]it [C]ommits',
})

vim.keymap.set('n', '<leader>sgb', builtin.git_branches, {
  desc = '[S]earch [G]it [B]ranches',
})

vim.keymap.set('n', '<leader>sgs', builtin.git_stash, {
  desc = '[S]earch [G]it [S]tash',
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
pcall(require('telescope').load_extension, 'refactoring')
