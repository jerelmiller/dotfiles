local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')
    .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])

    print('==================================')
    print('    Plugins are being installed')
    print('    Wait until Packer completes,')
    print('       then restart nvim')
    print('==================================')

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Use a popup window for packer
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({
        border = 'rounded',
      })
    end,
  },
})

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({'arcticicestudio/nord-vim', config = function()
    vim.cmd('colorscheme nord')
  end})

  use('numToStr/Comment.nvim')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-tree/nvim-tree.lua')
  use('alexghergh/nvim-tmux-navigation')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'quangnguyen30192/cmp-nvim-ultisnips'}
    }
  }

  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('tpope/vim-unimpaired')
  use('tpope/vim-abolish')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Automatically source and re-compile packer whenever you save the packer.lua file
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerInstall',
  group = vim.api.nvim_create_augroup('Packer', {
    clear = true,
  }),
  pattern = 'packer.lua',
})
