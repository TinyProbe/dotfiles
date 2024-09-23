vim.opt.background = "dark"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.encoding = "utf-8"
vim.opt.virtualedit = "all"
vim.opt.mousemoveevent = true
vim.opt.modelines = 1
vim.opt.laststatus = 2
vim.opt.compatible = false
vim.opt.hidden = true -- hide terminal
vim.opt.ttyfast = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.autoread = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.title = true
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = false
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.guicursor = "a:hor25-Cursor-blinkon300-blinkoff300"
vim.opt.mouse = "a"
vim.opt.updatetime = 0
vim.opt.timeout = false
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undolevels = 4096
-- vim.opt.spell = true
-- vim.opt.spelllang = "en"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 9
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = "tab:→·"
vim.opt.fillchars = "eob: "
vim.opt.foldcolumn = "auto"
vim.opt.foldmethod = "marker"

vim.g.rust_recommended_style = false

vim.cmd([[
syntax on
filetype off
filetype plugin indent on
]])
