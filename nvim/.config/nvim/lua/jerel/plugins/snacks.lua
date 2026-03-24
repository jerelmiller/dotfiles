return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    gitbrowse = {},
    image = {},
    input = {},
    words = {},
  },
  keys = {
    {
      "[r",
      function()
        Snacks.words.jump(-1, true)
      end,
      desc = "[LSP] Jump prev word reference",
    },
    {
      "]r",
      function()
        Snacks.words.jump(1, true)
      end,
      desc = "[LSP] Jump next word reference",
    },
  },
}
