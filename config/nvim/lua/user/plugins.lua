local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]

    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Use a popup window for packer
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = "rounded" })
    end
  }
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Automatically install LSPs to stdpath for neovim
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Useful status updates for LSP
  use 'j-hui/fidget.nvim'

  -- Additional lua configuration, makes nvim stuff amazing
  use 'folke/neodev.nvim'

  -- Smart commenting
  use 'numToStr/Comment.nvim'

  -- Helpful functions used by several plugins
  use 'nvim-lua/plenary.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use 'nvim-treesitter/playground'

  -- Smart autopairing
  use 'windwp/nvim-autopairs'
  use 'RRethy/nvim-treesitter-endwise'

  -- Fuzzy Finder (files, lsp, etc)
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }

  -- Git integration
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Highlight instances of word under cursor
  use 'RRethy/vim-illuminate'

  -- Add missing lsp colors
  use 'folke/lsp-colors.nvim'

  -- Nicer diagnostics
  use {
    'folke/trouble.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
  }

  -- Misc
  use 'tpope/vim-surround'

  -- Color schemes
  use 'arcticicestudio/nord-vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Automatically source and re-compile packer whenever you save the plugins.lua file
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerInstall',
  group = vim.api.nvim_create_augroup('Packer', { clear = true }),
  pattern = 'plugins.lua'
})
