return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
    "SmiteshP/nvim-navic",
  },
  config = function()
    local colors = require("catppuccin.palettes").get_palette("macchiato")

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
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            "copilot",
            show_loading = true,
            show_colors = true,
            symbols = {
              status = {
                hl = {
                  enabled = colors.green,
                  sleep = colors.subtext0,
                  disabled = colors.surface1,
                  warning = colors.yellow,
                  unknown = colors.red,
                },
              },
            },
          },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      -- Re-enable when I can figure out why this conditionally shows up outside
      -- of contexts.
      -- winbar = {
      --   lualine_c = {
      --     {
      --       "navic",
      --       color_correction = nil,
      --       navic_opts = { highlight = true },
      --     },
      --   },
      -- },
    })
  end,
}
