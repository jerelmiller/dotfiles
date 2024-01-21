return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      highlight_overrides = {
        macchiato = function(colors)
          return {
            ["@constant.builtin.typescript"] = { link = "Keyword" },
            ["@function.builtin"] = { fg = colors.yellow },
            ["@lsp.type.class.typescript"] = { fg = colors.sky },
            ["@lsp.typemod.class.declaration.typescript"] = { fg = colors.blue },
            ["@parameter"] = { fg = colors.rosewater },
            ["@punctuation.bracket"] = { fg = colors.red },
            ["@tag.attribute.tsx"] = { fg = colors.sky },
            ["@tag.delimiter"] = { fg = colors.maroon },
            ["@tag.tsx"] = { fg = colors.yellow },
            Boolean = { fg = colors.mauve },
            CmpGhostText = { fg = colors.overlay0 },
            CmpItemAbbr = { fg = colors.text },
            CmpItemAbbrMatch = {
              fg = colors.text,
              bg = colors.surface2,
              bold = true,
            },
            CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
            Comment = { fg = colors.surface1 },
            DiagnosticUnderlineError = { undercurl = true },
            DiagnosticUnderlineHint = { undercurl = true },
            DiagnosticUnderlineInfo = { undercurl = true },
            DiagnosticUnderlineWarn = { undercurl = true },
            DiagnosticUnnecessary = {
              fg = colors.surface2,
              sp = colors.yellow,
              undercurl = true,
              italic = true,
            },
            Number = { fg = colors.mauve },
            Operator = { fg = colors.subtext0 },
            Type = { fg = colors.rosewater },
          }
        end,
      },
      integrations = {
        aerial = true,
        fidget = true,
        harpoon = true,
        mason = true,
        notify = true,
        octo = true,
      },
    })

    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
