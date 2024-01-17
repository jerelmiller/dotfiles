return {
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')
      local trouble = require('trouble.providers.telescope')

      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { 'node_modules' },
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

      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>fw', builtin.live_grep)
      vim.keymap.set('n', '<leader>t', builtin.git_files)
    end
  }
}