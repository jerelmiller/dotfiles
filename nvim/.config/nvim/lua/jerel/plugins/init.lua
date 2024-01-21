return {
  "fladson/vim-kitty",
  "tpope/vim-abolish",
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
    end,
  },
}
