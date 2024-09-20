-- lazy.nvim install
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
vim.opt.runtimepath:prepend(lazypath)

-- plugin list
require("lazy").setup({
  -- require("plugins.autopairs"),
  require("plugins.autosave"),
  require("plugins.bufferline"),
  require("plugins.catppuccin"),
  require("plugins.colorizer"),
  require("plugins.comment"),
  require("plugins.lualine"),
  require("plugins.mini-icons"),
  require("plugins.neo-tree"),
  -- require("plugins.neoscroll"),
  require("plugins.telescope"),
  require("plugins.todo-comments"),
  require("plugins.treesitter"),
  require("plugins.which-key"),
})
