require('nvim-tree').setup({
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        git = {
          unstaged = 'ﰣ',
          staged = '',
          unmerged = '',
          renamed = '➜',
          untracked = '',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
  diagnostics = {
    enable = true,
  },
})
