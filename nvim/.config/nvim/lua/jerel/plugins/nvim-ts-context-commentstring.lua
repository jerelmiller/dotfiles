return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })

    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    })
  end,
}
