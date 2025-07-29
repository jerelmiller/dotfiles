return {
  "dmmulroy/tsc.nvim",
  config = function()
    require("tsc").setup({
      use_trouble_qflist = true,
    })

    vim.keymap.set("n", "<leader>ts", vim.cmd.TSC)
  end,
}
