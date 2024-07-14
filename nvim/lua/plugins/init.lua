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
  -- require("plugins.which_key"),
  -- require("plugins.autopairs"),
})

-- ==============================================================================
-- "neovim/nvim-lspconfig", name = "lspconfig",
-- config = function()
--   require("lspconfig").clangd.setup({
--     on_attach = function(client, bufnr)
--       displayKeymap("n", {buffer=bufnr, desc="goto declaration"}, "gD", vim.lsp.buf.declaration)
--       displayKeymap("n", {buffer=bufnr, desc="goto definition"}, "gd", vim.lsp.buf.definition)
--       displayKeymap("n", {buffer=bufnr, desc="show hover"}, "gK", vim.lsp.buf.hover)
--       displayKeymap("n", {buffer=bufnr, desc="rename identifier"}, "gr", vim.lsp.buf.rename)
--     end
--   })
--   require("lspconfig").pyright.setup({
--     on_attach = function(client, bufnr)
--       displayKeymap("n", {buffer=bufnr, desc="goto declaration"}, "gD", vim.lsp.buf.declaration)
--       displayKeymap("n", {buffer=bufnr, desc="goto definition"}, "gd", vim.lsp.buf.definition)
--       displayKeymap("n", {buffer=bufnr, desc="show hover"}, "gK", vim.lsp.buf.hover)
--       displayKeymap("n", {buffer=bufnr, desc="rename identifier"}, "gr", vim.lsp.buf.rename)
--     end,
--   })
-- end,
-- ==============================================================================
--   "williamboman/mason.nvim",                          name =          "mason",
-- ==============================================================================
--   "williamboman/mason-lspconfig.nvim",                name ="mason-lspconfig",
-- ==============================================================================
--   "hrsh7th/nvim-cmp",                                 name =       "nvim-cmp",
-- ==============================================================================
--   "hrsh7th/cmp-buffer",                               name =     "cmp-buffer",
-- ==============================================================================
--   "hrsh7th/cmp-nvim-lsp",                             name =   "cmp-nvim-lsp",
-- ==============================================================================
--   "jose-elias-alvarez/null-ls.nvim",                  name =        "null-ls",
-- ==============================================================================
--   "neoclide/coc.nvim",                                name =            "coc",
--   version = "*",
-- ==============================================================================
--   "onsails/lspkind.nvim",                             name =        "lspkind",
-- ==============================================================================
--   "nvimdev/lspsaga.nvim",                             name =        "lspsage",
-- ==============================================================================
--   "MunifTanjim/prettier.nvim",                        name =       "prettier",
