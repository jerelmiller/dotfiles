return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require("claudecode").setup()
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*claude*",
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set(
          "t",
          "<C-h>",
          "<C-\\><C-n><cmd>TmuxNavigateLeft<cr>",
          opts
        )
        vim.keymap.set(
          "t",
          "<C-j>",
          "<C-\\><C-n><cmd>TmuxNavigateDown<cr>",
          opts
        )
        vim.keymap.set("t", "<C-k>", "<C-\\><C-n><cmd>TmuxNavigateUp<cr>", opts)
        vim.keymap.set(
          "t",
          "<C-l>",
          "<C-\\><C-n><cmd>TmuxNavigateRight<cr>",
          opts
        )
      end,
    })
  end,
  keys = {
    { "<leader>c", nil, desc = "AI/Claude Code" },
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    {
      "<leader>cC",
      "<cmd>ClaudeCode --continue<cr>",
      desc = "Continue Claude",
    },
    {
      "<leader>cm",
      "<cmd>ClaudeCodeSelectModel<cr>",
      desc = "Select Claude model",
    },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    {
      "<leader>cs",
      "<cmd>ClaudeCodeSend<cr>",
      mode = "v",
      desc = "Send to Claude",
    },
    {
      "<leader>cs",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>cy", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
