return {
  "SmiteshP/nvim-navic",
  config = function()
    require("nvim-navic").setup({
      highlight = true,
    })

    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
}
