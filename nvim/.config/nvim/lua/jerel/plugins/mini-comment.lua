return {
  "echasnovski/mini.comment",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = {
    options = {
      ignore_blank_line = true,
      custom_commentstring = function()
        return require("ts_context_commentstring").calculate_commentstring()
          or vim.bo.commentstring
      end,
    },
  },
}
