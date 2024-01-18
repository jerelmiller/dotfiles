return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" } },
        },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "" } },
        },
      },
    })
  end,
}
