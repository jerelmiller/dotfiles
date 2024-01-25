return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    local filtered_messages = { "No information available" }

    -- Override notify function to filter out messages
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(message, level, opts)
      for _, msg in ipairs(filtered_messages) do
        if message == msg then
          return
        end
      end

      return notify(message, level, opts)
    end
  end,
}
