local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("jerel.plugins", {
  install = {
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "catppuccin", "habamax" },
  },
  change_detection = {
    -- Disable notifications when changes are found
    notify = false
  },
})
