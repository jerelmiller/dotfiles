return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    gitbrowse = {},
    image = {},
    scratch = {},
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
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle scratch buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select scratch buffer",
    },
    {
      "<leader>gb",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Open GitHub links from code",
      mode = { "n", "v" },
    },
  },
}
