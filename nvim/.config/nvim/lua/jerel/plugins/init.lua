return {
  "fladson/vim-kitty",
  "tpope/vim-abolish",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = false
      }
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          border = "rounded"
        }
      }
    }
  },
  {
    "echasnovski/mini.comment",
    opts = {
      options = {
        ignore_blank_line = true
      }
    }
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
    end
  }
}
