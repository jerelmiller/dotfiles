return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo = require("todo-comments")

    todo.setup()

    vim.keymap.set("n", "]t", function() todo.jump_next() end)
    vim.keymap.set("n", "[t", function() todo.jump_prev() end)
    vim.keymap.set("n", "<leader>xt", vim.cmd.TodoTrouble)
  end
}
