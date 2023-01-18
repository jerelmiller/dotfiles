local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { '.git' },
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-t>'] = trouble.open_with_trouble,
        ['<Esc>'] = actions.close,
      },
      n = {
        ['<C-t>'] = trouble.open_with_trouble,
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

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
