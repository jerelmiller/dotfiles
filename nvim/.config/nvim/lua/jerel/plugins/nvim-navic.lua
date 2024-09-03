return {
  "SmiteshP/nvim-navic",
  config = function()
    require("nvim-navic").setup({
      highlight = true,
    })

    vim.g.navic_silence = true
  end,
}
