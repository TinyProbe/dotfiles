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
  require("plugins.catppuccin"),
  require("plugins.bufferline"),
  require("plugins.lualine"),
  require("plugins.mini_icons"),
  require("plugins.neo_tree"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.colorizer"),
  require("plugins.comment"),
  require("plugins.autosave"),
  require("plugins.which_key"),
  -- require("plugins.autopairs"),
})
