local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local JerelGroup = augroup("Jerel", {})

autocmd("LspAttach", {
  group = JerelGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})
