return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo = require("todo-comments")

    todo.setup()

    vim.keymap.set("n", "]t", function()
      todo.jump_next()
    end, { desc = "Next todo" })
    vim.keymap.set("n", "[t", function()
      todo.jump_prev()
    end, { desc = "Previous todo" })
    vim.keymap.set(
      "n",
      "<leader>xt",
      vim.cmd.TodoTrouble,
      { desc = "Show todos in trouble" }
    )
  end,
}
