local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader before plugins to ensure correct mappings
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require('lazy').setup({
  {
    'arcticicestudio/nord-vim',
    lazy = false,
    priority = 1000
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'tpope/vim-abolish',
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'alexghergh/nvim-tmux-navigation',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter"
  }
})
