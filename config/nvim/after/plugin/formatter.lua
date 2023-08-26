require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    elixir = { require('formatter.filetypes.elixir').mixformat },
    javascript = { require('formatter.filetypes.javascript').prettier },
    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettier,
    },
    json = { require('formatter.filetypes.json').prettier },
    lua = { require('formatter.filetypes.lua').stylua },
    typescript = { require('formatter.filetypes.typescript').prettier },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },
    yaml = { require('formatter.filetypes.yaml').prettier },
    ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
  },
})

local augroup = vim.api.nvim_create_augroup('Formatting', {})

vim.api.nvim_create_autocmd('BufWritePost', {
  group = augroup,
  callback = function()
    vim.cmd.FormatWrite()
  end,
})
