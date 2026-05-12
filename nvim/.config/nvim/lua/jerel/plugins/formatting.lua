return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        css = { "prettierd", "prettier", "oxfmt" },
        elixir = { "mix" },
        graphql = { "prettierd", "prettier", "oxfmt" },
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", "oxfmt" },
        javascriptreact = { "prettierd", "prettier", "oxfmt" },
        json = { "prettierd", "prettier", "oxfmt" },
        jsonc = { "prettierd", "prettier", "oxfmt" },
        typescript = { "prettierd", "prettier", "oxfmt" },
        typescriptreact = { "prettierd", "prettier", "oxfmt" },
        yaml = { "oxfmt" },
      },
      default_format_opts = {
        stop_after_first = true,
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { lsp_format = "fallback" }
      end,
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
