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
    'vimdoc',
    'yaml',
  },
  auto_install = true,
  sync_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
