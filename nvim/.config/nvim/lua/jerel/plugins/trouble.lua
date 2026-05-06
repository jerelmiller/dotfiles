return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local trouble = require("trouble")

      trouble.setup({
        auto_preview = false,
        auto_refresh = true,
        focus = true,
      })

      vim.keymap.set("n", "<leader>xx", function()
        trouble.toggle()
      end)
      vim.keymap.set("n", "<leader>xw", function()
        trouble.toggle("diagnostics")
      end)
      vim.keymap.set("n", "<leader>xd", function()
        trouble.toggle({ mode = "diagnostics", filter = { buf = 0 } })
      end)
      vim.keymap.set("n", "<leader>xq", function()
        trouble.toggle("quickfix")
      end)
      vim.keymap.set("n", "<leader>xl", function()
        trouble.toggle("loclist")
      end)
      vim.keymap.set("n", "gr", function()
        trouble.toggle("lsp_references")
      end)
      vim.keymap.set("n", "]d", function()
        trouble.next({ skip_groups = true, jump = true })
      end)
      vim.keymap.set("n", "[d", function()
        trouble.prev({ skip_groups = true, jump = true })
      end)
    end,
  },
}
