local signs = require("jerel.signs")

vim.diagnostic.config({
  float = {
    border = "rounded",
    source = true,
  },
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
})

for type, icon in pairs(signs.diagnostic) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
