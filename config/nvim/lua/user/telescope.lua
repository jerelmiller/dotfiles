local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-t>'] = trouble.open_with_trouble,
      },
      n = {
        ['<C-t>'] = trouble.open_with_trouble,
      },
    }
  },
})

pcall(require('telescope').load_extension, 'fzf')
