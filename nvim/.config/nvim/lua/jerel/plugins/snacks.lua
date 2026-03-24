return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    image = {},
    input = {},
    words = {},
  },
  keys = {
    {
      "[r",
      function()
        require("snacks").words.jump(-1, true)
      end,
      desc = "[LSP] Jump prev word reference",
    },
    {
      "]r",
      function()
        require("snacks").words.jump(1, true)
      end,
      desc = "[LSP] Jump next word reference",
    },
  },
}
