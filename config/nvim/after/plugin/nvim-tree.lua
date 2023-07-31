vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>f', vim.cmd.NvimTreeFindFile)

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
