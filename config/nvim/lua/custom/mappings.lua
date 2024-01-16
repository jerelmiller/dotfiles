local M = {}

M.dap = {
  n = {
    ["<leader>db"] = { vim.cmd.DapToggleBreakpoint, "Add breakpoint at line" },
    ["<leader>dr"] = { vim.cmd.DapContinue, "Run or continue the debugger" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
  },
}

M.fugitive = {
  n = {
    ["<leader>gs"] = { vim.cmd.Git, "Git status" },
  },
}

M.telescope = {
  n = {
    ["<leader>t"] = { "<cmd> Telescope git_files <CR>", "Git Files" },
  },
}

M.diagnostic = {
  n = {
    ["[g"] = { vim.diagnostic.goto_prev, "Go to prev diagnostic" },
    ["]g"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
    ["<leader>e"] = { vim.diagnostic.open_float, "Show diagnostics" },
  },
}

M.general = {
  n = {
    -- Use 0 to go to first character instead of beginning of line
    ["0"] = { "^", "Beginning of line" },
  },
}

return M
