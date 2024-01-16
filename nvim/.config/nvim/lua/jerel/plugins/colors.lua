return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      highlight_overrides = {
        macchiato = function(colors)
          return {
            ["@parameter"] = { fg = colors.rosewater },
            ["@punctuation.bracket"] = { fg = colors.red },
            ["@tag.attribute.tsx"] = { fg = colors.sky },
            ["@tag.delimiter"] = { fg = colors.maroon },
            ["@tag.tsx"] = { fg = colors.yellow },
            Comment = { fg = colors.surface1 },
            Operator = { fg = colors.subtext0 },
          }
        end
      },
    })

    vim.cmd.colorscheme("catppuccin-macchiato")
  end
}
