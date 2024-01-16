vim.g.mapleader = ","

-- Automatically re-read the file if changed outside of vim
vim.o.autoread = true

-- Don't create a backup file
vim.o.backup = false

-- Show a column indicator
vim.opt.colorcolumn = "80"

-- Don't add cursor styling
vim.o.guicursor = ""

-- Show line number relative to line cursor is on
vim.wo.relativenumber = true

-- # of lines of text above/below the cursor when scrolling
vim.o.scrolloff = 4

-- Round indent to nearest shift width
vim.o.shiftround = true

-- # of columns of text to the left/right of the cursor when scrolling
vim.o.sidescrolloff = 5

-- Don't use a swapfile for the buffer
vim.o.swapfile = false

-- Don't wrap lines
vim.o.wrap = false

-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.writebackup = false

vim.diagnostic.config {
  virtual_text = {
    format = function(diagnostic)
      return string.format("[%s] %s (%s)", diagnostic.source, diagnostic.message, diagnostic.code)
    end,
  },
  float = {
    format = function(diagnostic)
      return string.format("[%s] %s", diagnostic.source, diagnostic.message)
    end,
    border = "rounded",
  },
}
