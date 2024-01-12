return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'javascript',
        'lua',
        'typescript',
        'vim',
        'vimdoc',
        'query'
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end
}
