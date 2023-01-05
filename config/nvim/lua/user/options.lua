vim.g.mapleader = ','

-- Nord settings which must be set before 'colorscheme'
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

-- Colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme nord]]

-- Automatically re-read the file if changed outside of vim
vim.o.autoread = true

-- Don't create a backup file
vim.o.backup = false

-- Allow neovim to access the system clipboard
vim.o.clipboard = 'unnamedplus'

-- Show a column indicator
vim.o.colorcolumn = 80

-- Better completion experience
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Highlight the current line
vim.o.cursorline = true

-- Use spaces to for indents
vim.o.expandtab = true

-- Encode written files with UTF-8 encoding
vim.o.filencoding = "utf-8"

-- Don't insert current comment leader automatically when hitting 'o' or 'O' in normal mode
vim.opt.formatoptions:remove({ "o" })

-- Don't add cursor styling
vim.o.guicursor = ''

-- Highlight all matches on previous search patterns
vim.o.hlsearch = true

-- Progressively search as pattern is typed
vim.o.incsearch = true

-- Ignore case in search patterns
vim.o.ignorecase = true

-- Enable line numbers
vim.wo.number = true

-- Show line number relative to line cursor is on
vim.wo.relativenumber = true

-- separate vim plugins from neovim in case vim still in use
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

-- # of lines of text above/below the cursor when scrolling
vim.o.scrolloff = 4

-- Round indent to nearest shift width
vim.o.shiftround = true

-- # of spaces inserted for an indentation
vim.o.shiftwidth = 2

-- Don't give |ins-completion-menu| messages
vim.opt.shortmess:append 'c'

-- Don't show messages like -- INSERT --
vim.o.showmode = false

-- # of columns of text to the left/right of the cursor when scrolling
vim.o.sidescrolloff = 5

-- Always show the sign column to avoid text shift
vim.wo.signcolumn = 'yes'

-- Override ignorecase if pattern contains uppercase characters
vim.o.smartcase = true

-- Make indenting smarter when starting a new line
vim.o.smartindent = true

-- Smarter tabbing when using tab in the front of a line
vim.o.smarttab = true

-- # of spaces that a tab uses when performing editing operations
vim.o.softtabstop = 2

-- Force all vertical splits to go the right of the current window
vim.o.splitright = true

-- Force all horizontal splits to go below the current window
vim.o.splitbelow = true

-- Don't use a swapfile for the buffer
vim.o.swapfile = false

-- # of spaces for a tab
vim.o.tabstop = 2

-- Faster time to wait for a mapped sequence to complete (in milliseconds)
vim.o.timeoutlen = 300

-- Enable persistent undo
vim.o.undofile = true

-- Faster completion
vim.o.updatetime = 300

-- Don't wrap lines
vim.o.wrap = false

-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.writebackup = false
