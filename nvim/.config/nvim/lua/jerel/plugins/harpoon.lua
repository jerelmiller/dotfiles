return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    local ext = require("harpoon.extensions")
    harpoon:extend(ext.builtins.highlight_current_file())
    harpoon:extend(ext.builtins.navigate_with_number())

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })
        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })
        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })

    for i = 1, 4 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, { desc = "Harpoon file " .. i })
    end

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon menu" })

    vim.keymap.set("n", "]f", function()
      harpoon:list():next({ ui_nav_wrap = true })
    end, { desc = "Harpoon next" })
    vim.keymap.set("n", "[f", function()
      harpoon:list():prev({ ui_nav_wrap = true })
    end, { desc = "Harpoon prev" })
  end,
}
