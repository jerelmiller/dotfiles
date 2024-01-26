-- Alias common mistyped commands
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

-- Use 0 to go to first character instead of beginning of line
vim.keymap.set("n", "0", "^")

-- Move selected text up/down in the buffer
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Use ctrl-h/j/k/l to move between splits
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Show code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Keep cursor in position when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle of screen when moving page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle of screen when navigating between search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Navigate soft wrapped lines with j/k
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
