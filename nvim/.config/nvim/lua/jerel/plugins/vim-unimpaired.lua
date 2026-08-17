return {
  "tpope/vim-unimpaired",
  init = function()
    -- Empty string tells unimpaired to skip creating the map.
    -- See s:Map() / g:nremap in plugin/unimpaired.vim
    local skip = {
      ["]a"] = "", -- treesitter parameter
      ["[a"] = "",
      ["]A"] = "",
      ["[A"] = "",
      ["]f"] = "", -- harpoon
      ["[f"] = "",
      ["]t"] = "", -- todo-comments
      ["[t"] = "",
      ["]x"] = "", -- neotest failed
      ["[x"] = "",
    }
    vim.g.nremap = vim.tbl_extend("force", vim.g.nremap or {}, skip)
    vim.g.xremap = vim.tbl_extend("force", vim.g.xremap or {}, {
      ["]x"] = "",
      ["[x"] = "",
    })
  end,
}
