local signs = require("jerel.signs")

vim.diagnostic.config({
  float = {
    source = true,
  },
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.diagnostic.Error,
      [vim.diagnostic.severity.WARN] = signs.diagnostic.Warn,
      [vim.diagnostic.severity.HINT] = signs.diagnostic.Hint,
      [vim.diagnostic.severity.INFO] = signs.diagnostic.Info,
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  },
})
