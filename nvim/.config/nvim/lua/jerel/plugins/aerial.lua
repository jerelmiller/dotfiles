return {
  'stevearc/aerial.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup()

    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")
  end
}
