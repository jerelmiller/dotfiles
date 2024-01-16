---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  hl_override = {
    Type = {
      -- Rosewater
      fg = "#f5e0dc",
    },
  },
  hl_add = {
    TabLine = {
      fg = "light_grey",
      bg = "black2",
    },
    TabLineFill = {
      bg = "black2",
    },
    TabLineSel = {
      fg = "white",
      bg = "black",
    },
  },
  tabufline = {
    enabled = false,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
