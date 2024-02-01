return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup()
    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<C-n>", function()
      api.tree.toggle({ find_file = true, focus = true })
    end)
    vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle)
  end,
}
