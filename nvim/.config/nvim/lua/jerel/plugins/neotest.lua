return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    local neotest = require("neotest")

    ---@diagnostic disable-next-line: missing-fields
    neotest.setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jest_test_discovery = true,
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
      ---@diagnostic disable-next-line: missing-fields
      discovery = {
        enabled = false,
      },
    })

    vim.keymap.set("n", "<leader>sf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Test file" })
    vim.keymap.set("n", "<leader>sl", function()
      neotest.run.run_last()
    end, { desc = "Test last" })
    vim.keymap.set("n", "<leader>sn", function()
      neotest.run.run()
    end, { desc = "Test nearest" })
    vim.keymap.set("n", "<leader>st", function()
      neotest.summary.toggle()
    end, { desc = "Toggle test summary" })
    vim.keymap.set("n", "<leader>so", function()
      neotest.output.open({ enter = true })
    end, { desc = "Open test output" })
    vim.keymap.set("n", "]s", function()
      neotest.jump.next()
    end, { desc = "Jump to next test" })
    vim.keymap.set("n", "[s", function()
      neotest.jump.prev()
    end, { desc = "Jump to previous test" })
    vim.keymap.set("n", "]x", function()
      neotest.jump.next({ status = "failed" })
    end, { desc = "Jump to next failed test" })
    vim.keymap.set("n", "[x", function()
      neotest.jump.prev({ status = "failed" })
    end, { desc = "Jump to previous failed test" })
  end,
}
