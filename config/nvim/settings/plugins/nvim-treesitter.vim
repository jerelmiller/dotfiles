lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "eex",
    "elixir",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "regex",
    "ruby",
    "scss",
    "typescript",
    "vim",
    "yaml"
  },

  auto_install = true,

  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true
  },
}
EOF
