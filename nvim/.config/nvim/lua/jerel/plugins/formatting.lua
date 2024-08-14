return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        css = { "prettierd", "prettier" },
        elixir = { "mix" },
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        jsonc = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
      },
      default_format_opts = {
        stop_after_first = true,
      },
      format_on_save = {
        lsp_format = "fallback",
      },
    })
  end,
}
