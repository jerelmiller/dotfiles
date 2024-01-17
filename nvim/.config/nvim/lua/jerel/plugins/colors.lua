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
            Comment = { fg = colors.surface1 },
            DiagnosticUnderlineError = { undercurl = true },
            DiagnosticUnderlineHint = { undercurl = true },
            DiagnosticUnderlineInfo = { undercurl = true },
            DiagnosticUnderlineWarn = { undercurl = true },
            DiagnosticUnnecessary = { fg = colors.surface2, sp = colors.yellow, undercurl = true, italic = true },
            Operator = { fg = colors.subtext0 },
            Type = { fg = colors.rosewater }
          }
        end
      },
    })

    vim.cmd.colorscheme("catppuccin-macchiato")
  end
}
