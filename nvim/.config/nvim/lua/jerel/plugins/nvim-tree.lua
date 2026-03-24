return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup()
    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<C-n>", function()
      api.tree.toggle({ find_file = true, focus = true })
    end)
    vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle)

    local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeSetup",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if
            prev.new_name ~= data.new_name or prev.old_name ~= data.old_name
          then
            data = data
            Snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })
  end,
}
