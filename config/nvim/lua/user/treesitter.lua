require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'eex',
    'elixir',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'graphql',
    'help',
    'html',
    'javascript',
    'json',
    'json5',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'query',
    'regex',
    'ruby',
    'scss',
    'sql',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  endwise = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = '<C-s>',
      node_decremental = '<C-backspace>',
    },
  },
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'rounded',
      floating_preview_opts = {},
      peek_definition_code = {
        ['<leader>df'] = '@function.outer',
        ['<leader>dF'] = '@class.outer',
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        ['am'] = {
          query = '@comment.outer',
          desc = '[a]round comment',
        },
        ['an'] = {
          query = '@conditional.outer',
          desc = '[a]round co[n]ditional',
        },
        ['in'] = {
          query = '@conditional.inner',
          desc = '[i]nside co[n]ditional',
        },
        ['al'] = {
          query = '@loop.outer',
          desc = '[a]round [l]oop',
        },
        ['il'] = {
          query = '@loop.inner',
          desc = '[i]nside [l]oop',
        },
        ['aa'] = {
          query = '@parameter.outer',
          desc = '[a]round [a]rgument',
        },
        ['ia'] = {
          query = '@parameter.inner',
          desc = '[i]nside [a]rgument',
        },
        ['af'] = {
          query = '@function.outer',
          desc = '[a]round [f]unction',
        },
        ['if'] = {
          query = '@function.inner',
          desc = '[i]inside [f]unction',
        },
        ['ac'] = {
          query = '@class.outer',
          desc = '[a]round [c]lass',
        },
        ['ic'] = {
          query = '@class.inner',
          desc = '[i]nside [c]lass',
        },
      },
    },
    move = {
      enable = true,

      -- Whether to set jumps in the jumplist
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
})
