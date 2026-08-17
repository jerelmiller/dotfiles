return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        css = { "oxfmt", "prettierd", "prettier" },
        elixir = { "mix" },
        graphql = { "oxfmt", "prettierd", "prettier" },
        lua = { "stylua" },
        javascript = { "oxfmt", "prettierd", "prettier" },
        javascriptreact = { "oxfmt", "prettierd", "prettier" },
        json = { "oxfmt", "prettierd", "prettier" },
        jsonc = { "oxfmt", "prettierd", "prettier" },
        rust = { "rustfmt" },
        typescript = { "oxfmt", "prettierd", "prettier" },
        typescriptreact = { "oxfmt", "prettierd", "prettier" },
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

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end)

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
