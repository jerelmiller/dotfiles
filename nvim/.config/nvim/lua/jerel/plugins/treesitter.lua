return {
  'windwp/nvim-ts-autotag',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'css',
          'diff',
          'dockerfile',
          'elixir',
          'erlang',
          'git_config',
          'git_rebase',
          'gitcommit',
          'gitignore',
          'heex',
          'html',
          'http',
          'javascript',
          'jsdoc',
          'json',
          'jsonc',
          'jq',
          'lua',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'query',
          'regex',
          'ruby',
          'scss',
          'sql',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml'
        },
        autotag = {
          enable = true
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>"
          }
        },
      })
    end
  },
}
