-- lazy.nvim install
local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",    -- latest stable release
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- plugin list
require("lazy").setup({
  {     -- =====================================================================
    "catppuccin/nvim",                                  name =     "catppuccin",
    priority = 1000,
  }, {  -- =====================================================================
    "akinsho/bufferline.nvim",                          name =     "bufferline", -- separetor color?
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }, {  -- =====================================================================
    "nvim-lualine/lualine.nvim",                        name =        "lualine",
  }, {  -- =====================================================================
    "nvim-neo-tree/neo-tree.nvim",                      name =       "neo-tree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }, {  -- =====================================================================
    "nvim-telescope/telescope.nvim",                    name =      "telescope",
    tag = '0.1.2', -- or branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  }, {  -- =====================================================================
    "nvim-telescope/telescope-file-browser.nvim",       name =      "tfbrowser",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    }
  }, {  -- =====================================================================
    "nvim-treesitter/nvim-treesitter",                  name =     "treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  }, {  -- =====================================================================
    "numToStr/Comment.nvim",                            name =        "comment",
    lazy = false,
  }, {  -- =====================================================================
    "karb94/neoscroll.nvim",                            name =      "neoscroll",
  }, {  -- =====================================================================
    "norcalli/nvim-colorizer.lua",                      name =      "colorizer",
  }, {  -- =====================================================================
    "windwp/nvim-autopairs",                            name =      "autopairs",
    event = "InsertEnter",
  }, {  -- =====================================================================
    "akinsho/toggleterm.nvim",                          name =     "toggleterm",
    version = "*",
    config = true,
  -- }, {  -- =====================================================================
  --   "folke/which-key.nvim",                             name =      "which-key",
  --   event = "VeryLazy",
  -- }, {  -- =====================================================================
  --   "neovim/nvim-lspconfig",                            name =      "lspconfig",
  -- }, {  -- =====================================================================
  --   "williamboman/mason.nvim",                          name =          "mason",
  -- }, {  -- =====================================================================
  --   "williamboman/mason-lspconfig.nvim",                name ="mason-lspconfig",
  -- }, {  -- =====================================================================
  --   "hrsh7th/nvim-cmp",                                 name =       "nvim-cmp",
  -- }, {  -- =====================================================================
  --   "hrsh7th/cmp-buffer",                               name =     "cmp-buffer",
  -- }, {  -- =====================================================================
  --   "hrsh7th/cmp-nvim-lsp",                             name =   "cmp-nvim-lsp",
  -- }, {  -- =====================================================================
  --   "jose-elias-alvarez/null-ls.nvim",                  name =        "null-ls",
  -- }, {  -- =====================================================================
  --   "neoclide/coc.nvim",                                name =            "coc",
  --   version = "*",
  -- }, {  -- =====================================================================
  --   "onsails/lspkind.nvim",                             name =        "lspkind",
  -- }, {  -- =====================================================================
  --   "nvimdev/lspsaga.nvim",                             name =        "lspsage",
  -- }, {  -- =====================================================================
  --   "MunifTanjim/prettier.nvim",                        name =       "prettier",
  },    -- =====================================================================
})

require("plug_in.catppuccin")
require("plug_in.bufferline")
require("plug_in.lualine")
require("plug_in.neo_tree")
require("plug_in.telescope")
require("plug_in.tfbrowser")
require("plug_in.treesitter")
require("plug_in.comment")
require("plug_in.neoscroll")
require("plug_in.colorizer")
require("plug_in.autopairs")
require("plug_in.toggleterm")
require("plug_in.which_key")

-- lspconfig {{{
-- require("lspconfig").clangd.setup({
--   on_attach = function(client, bufnr)
--     displayKeymap("n", {buffer=bufnr, desc="goto declaration"}, "gD", vim.lsp.buf.declaration)
--     displayKeymap("n", {buffer=bufnr, desc="goto definition"}, "gd", vim.lsp.buf.definition)
--     displayKeymap("n", {buffer=bufnr, desc="show hover"}, "gK", vim.lsp.buf.hover)
--     displayKeymap("n", {buffer=bufnr, desc="rename identifier"}, "gr", vim.lsp.buf.rename)
--   end
-- })
-- require("lspconfig").pyright.setup({
--   on_attach = function(client, bufnr)
--     displayKeymap("n", {buffer=bufnr, desc="goto declaration"}, "gD", vim.lsp.buf.declaration)
--     displayKeymap("n", {buffer=bufnr, desc="goto definition"}, "gd", vim.lsp.buf.definition)
--     displayKeymap("n", {buffer=bufnr, desc="show hover"}, "gK", vim.lsp.buf.hover)
--     displayKeymap("n", {buffer=bufnr, desc="rename identifier"}, "gr", vim.lsp.buf.rename)
--   end,
-- })
-- }}}

-- mason {{{
-- }}}

-- mason-lspconfig {{{
-- }}}

-- nvim-cmp {{{
-- }}}

-- cmp-buffer {{{
-- }}}

-- cmp-nvim-lsp {{{
-- }}}

-- null-ls {{{
-- }}}

-- coc {{{
-- }}}

-- lspkind {{{
-- }}}

-- lspsaga {{{
-- }}}

-- prettier {{{
-- }}}
