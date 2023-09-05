-- Options {{{
vim.opt.background = "dark"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.encoding = "utf-8"
vim.opt.modelines = 1
vim.opt.laststatus = 2
vim.opt.compatible = false
vim.opt.hidden = true
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
-- vim.opt.guifont = "SFMono Nerd Font:h16"
-- vim.opt.guicursor = "a:block-blinkwait0"
vim.opt.title = true
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.mouse = "a"
vim.opt.updatetime = 0
vim.opt.timeout = false
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache").."/undo"
vim.opt.undolevels = 4096
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 9
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = "tab:→·"
vim.opt.fillchars = "eob: "
vim.opt.foldcolumn = "auto"
vim.opt.foldmethod = "marker"
-- vim.opt.foldexpr=GetFold(v:lnum)
vim.cmd([[
syntax on
filetype off
filetype plugin indent on
]])
-- }}}

-- Auto Commands {{{
vim.api.nvim_create_augroup("vimrcEx", {})
vim.api.nvim_create_autocmd({ "FileType", }, {
  group = "vimrcEx",
  pattern = { "text", },
  callback = function()
    vim.opt_local.textwidth = 78
  end,
})

vim.api.nvim_create_augroup("PreventBackupPrivate", {})
vim.api.nvim_create_autocmd({ "BufWrite", }, {
  group = "PreventBackupPrivate",
  pattern = { "/private/tmp/crontab.*", "/private/etc/pw.*", },
  callback = function()
    vim.opt_local.writebackup = false
  end,
})

vim.api.nvim_create_augroup("BufDefault", {})
vim.api.nvim_create_autocmd({ "BufNewFile", }, {
  group = "BufDefault",
  pattern = { "*", },
  callback = function()
    vim.cmd("write")
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = {
    "*.c", "*.h", "*.cpp", "*.hpp", "*.cs", "*.rs", "*.java", "*.js",
    "*.php", "*.go", "*.kt", "*.kts",
  },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cinkeys:append("0=break")
    vim.opt_local.cinoptions = ":s,l1,b1,g0,(s,us,U1,Ws,m1,j1,J1"
  end,
})
-- }}}

-- Functions {{{
-- mapping key with display description(if format is correctly)
-- desc[ "_:..." | "...:_" ]: _[n|v|i]: what a mode when just before echo
-- "_:...": do echo before action, "...:_": do echo after action
function keyMapping(mode, opt, key, act, desc)
  function echoInterpolation(desc, mode)
    command=":echo '"..desc.."'<CR>"
    if mode=="v" then
      command="<ESC>"..command.."gv"
    elseif mode=="i" then
      command="<ESC>`^"..command.."i"
    end
    return command
  end
  command=""
  if string.sub(desc, 1, 1)==":" and string.find("nvi", string.sub(desc, 0, 0))~=nil then
    command=echoInterpolation(string.sub(desc, 2, -1), string.sub(desc, 0, 0))..act
  elseif string.sub(desc, -2, -2)==":" and string.find("nvi", string.sub(desc, -1, -1))~=nil then
    command=act..echoInterpolation(string.sub(desc, 0, -3), string.sub(desc, -1, -1))
  else
    command=act
  end
  vim.keymap.set(mode, key, command, opt)
end
-- }}}

-- Key Mappings {{{
vim.cmd('mapclear')
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local unit = 5

keyMapping("",  {}, "<C-q>", "<NOP>", 'prevent key')
keyMapping("",  {}, "<Up>", "<NOP>", 'prevent key')
keyMapping("",  {}, "<Down>", "<NOP>", 'prevent key')
keyMapping("",  {}, "<Left>", "<NOP>", 'prevent key')
keyMapping("",  {}, "<Right>", "<NOP>", 'prevent key')
keyMapping("",  {}, "gg", "<NOP>", 'prevent key')
keyMapping("",  {}, "G", "<NOP>", 'prevent key')
keyMapping("n", {}, "p", "<NOP>", 'prevent key')
keyMapping("n", {}, "P", "<NOP>", 'prevent key')

keyMapping("n", { silent=true }, "<Leader>co", ":edit ~/.config/nvim/init.lua<CR>", 'open config:n')
keyMapping("n", { silent=true }, "<Leader>cr", ":source ~/.config/nvim/init.lua<CR>", 'reload config:n')
keyMapping("n", { silent=true }, "<Leader>fe", ":edit .<CR>", 'file explorer:n')
keyMapping("n", { silent=true }, "<Leader>bs", ":buffers<CR>", 'buffer list:n')
keyMapping("n", { silent=true }, "<Leader>bd", ":bdelete<CR>", 'delete buffer:n')
keyMapping("n", { silent=true }, "<Leader>bn", ":bnext<CR>", 'next buffer:n')
keyMapping("n", { silent=true }, "<Leader>bp", ":bprevious<CR>", 'previous buffer:n')
keyMapping("n", { silent=true }, "<Leader>bh", ":bfirst<CR>", 'first buffer:n')
keyMapping("n", { silent=true }, "<Leader>bl", ":blast<CR>", 'last buffer:n')
keyMapping("n", { silent=true }, "<Leader>ts", ":tabs<CR>", 'tab list:n')
keyMapping("n", { silent=true }, "<Leader>tc", ":tabclose<CR>", 'close tab:n')
keyMapping("n", { silent=true }, "<Leader>tn", ":tabnext<CR>", 'next tab:n')
keyMapping("n", { silent=true }, "<Leader>tp", ":tabprevious<CR>", 'previous tab:n')
keyMapping("n", { silent=true }, "<Leader>th", ":tabfirst<CR>", 'first tab:n')
keyMapping("n", { silent=true }, "<Leader>tl", ":tablast<CR>", 'last tab:n')

keyMapping("n", {}, "<", "<<", 'outdent:n')
keyMapping("n", {}, ">", ">>", 'indent:n')
keyMapping("v", {}, "<", "<gv", 'outdent-line')
keyMapping("v", {}, ">", ">gv", 'indent-line')
keyMapping("v", {}, "H", "<gv", 'outdent-line')
keyMapping("v", {}, "L", ">gv", 'indent-line')

keyMapping("n", {}, "h", "<BS>", 'move left')
keyMapping("n", {}, "l", "<Space>", 'move right')
keyMapping("v", {}, "h", "<BS>", 'move left')
keyMapping("v", {}, "l", "<Space>", 'move right')

keyMapping("n", { silent=true }, "<C-q>q", ":xa<CR>", 'quit with save')
keyMapping("n", { silent=true }, "<C-q>c", ":qa!<CR>", 'quit without save')
keyMapping("n", { silent=true }, "<C-q>b", ":bdelete<CR>", 'delete buffer:n')
keyMapping("n", {}, "<C-q>w", "<C-w>c", 'close window:n')
keyMapping("n", { silent=true }, "<C-q>t", ":tabclose<CR>", 'close tab:n')

keyMapping("n", {}, "gk", "gg0", 'goto number[=1] line:n')
keyMapping("n", {}, "gj", "G0zz", 'goto last line:n')
keyMapping("n", {}, "gt", "H0", 'goto top screen:n')
keyMapping("n", {}, "gc", "M0", 'goto center screen:n')
keyMapping("n", {}, "gb", "L0", 'goto bottom screen:n')
keyMapping("n", {}, "gs", "_", 'goto first character:n')
keyMapping("n", {}, "ge", "g_", 'goto last character:n')
keyMapping("n", {}, "gh", "0", 'goto first column:n')
keyMapping("n", {}, "gl", "$", 'goto last column:n')
keyMapping("n", {}, "gm", "gM", 'goto middle character:n')
keyMapping("n", {}, "gM", "gm", 'goto ???:n')
keyMapping("n", { silent=true }, "gn", ":bnext<CR>zz", 'goto next buffer:n')
keyMapping("n", { silent=true }, "gp", ":bprevious<CR>zz", 'goto previous buffer:n')
keyMapping("v", {}, "gk", "gg0", 'goto number[=1] line:v')
keyMapping("v", {}, "gj", "G0zz", 'goto last line:v')
keyMapping("v", {}, "gt", "H0", 'goto top screen:v')
keyMapping("v", {}, "gc", "M0", 'goto center screen:v')
keyMapping("v", {}, "gb", "L0", 'goto bottom screen:v')
keyMapping("v", {}, "gs", "_", 'goto first character:v')
keyMapping("v", {}, "ge", "g_", 'goto last character:v')
keyMapping("v", {}, "gh", "0", 'goto first column:v')
keyMapping("v", {}, "gl", "$", 'goto last column:v')
keyMapping("v", {}, "gm", "gM", 'goto middle character:v')
keyMapping("v", {}, "gM", "gm", 'goto ???:v')
keyMapping("v", { silent=true }, "gn", "<ESC>:bnext<CR>zz", 'goto next buffer:n')
keyMapping("v", { silent=true }, "gp", "<ESC>:bprevious<CR>zz", 'goto previous buffer:n')

keyMapping("n", {}, "<C-h>", unit.."<BS>", 'move left unit:n')
keyMapping("n", {}, "<C-l>", unit.."<Space>", 'move right unit:n')
keyMapping("n", {}, "<C-j>", unit.."<C-e>", 'move scroll down unit:n')
keyMapping("n", {}, "<C-k>", unit.."<C-y>", 'move scroll up unit:n')
keyMapping("v", {}, "<C-h>", unit.."<BS>", 'move left unit')
keyMapping("v", {}, "<C-l>", unit.."<Space>", 'move right unit')
keyMapping("v", {}, "<C-j>", unit.."<C-e>", 'move scroll down unit')
keyMapping("v", {}, "<C-k>", unit.."<C-y>", 'move scroll up unit')

keyMapping("n", {}, "piw", "viwp", 'paste inner word(ignored):n')
keyMapping("n", {}, "Piw", "viwP", 'paste inner word(yanked):n')
keyMapping("n", {}, "pp", "p", 'paste back:n')
keyMapping("n", {}, "PP", "P", 'paste front:n')
keyMapping("v", {}, "p", "P", 'replace to select(ignored):n')
keyMapping("v", {}, "P", "p", 'replace to select(yanked):n')
keyMapping("v", {}, "u", "<ESC>u", 'undo:n')
keyMapping("v", {}, "U", "<ESC>u", 'undo:n')

keyMapping("n", {}, "-", "<C-x>", 'decrease value:n')
keyMapping("n", {}, "=", "<C-a>", 'increase value:n')
keyMapping("n", {}, "<C-a>", "GVgg", 'select all:v')
keyMapping("n", { silent=true }, "<C-s>", ":wa<CR>", 'save all buffer:n')
keyMapping("n", {}, "<Leader>y", "mqGVggy`qzz", 'yank all:n')
keyMapping("n", {}, "<Leader>=", "mqGVgg=`qzz", 'reindention:n')
keyMapping("n", {}, "<Leader>-", '/\\<\\><CR>', 'clear register')
keyMapping("v", { silent=true }, "J", ":m'>+<CR>gv", 'selected line down')
keyMapping("v", { silent=true }, "K", ":m-2<CR>gv", 'selected line up')
keyMapping("n", { silent=true }, "<Leader>/", "mq:call CommentToggle()<CR>`q", 'toggle comment:n')
keyMapping("v", { silent=true }, "<Leader>/", "mq:call CommentToggle()<CR>`q", 'toggle comment:n')

keyMapping("o", { silent=true }, "i<Space>", ":<C-u>normal lBvhE<CR>", 'inner from space')
keyMapping("v", { silent=true }, "i<Space>", ":<C-u>normal lBvhE<CR>", 'inner from space')
keyMapping("o", { silent=true }, "ic", ":<C-u>normal _vg_<CR>", 'inner characters')
keyMapping("v", { silent=true }, "ic", ":<C-u>normal _vg_<CR>", 'inner characters')
keyMapping("o", { silent=true }, "il", ":<C-u>normal 0v$<CR>", 'inner line')
keyMapping("v", { silent=true }, "il", ":<C-u>normal 0v$<CR>", 'inner line')

keyMapping("v", {}, "ms(", "s()<ESC>hpl%", 'match surround():n')
keyMapping("v", {}, "ms)", "ms(", 'match surround():n')
keyMapping("v", {}, "ms{", "s{}<ESC>hpl%", 'match surround{}:n')
keyMapping("v", {}, "ms}", "ms{", 'match surround{}:n')
keyMapping("v", {}, "ms[", "s[]<ESC>hpl%", 'match surround[]:n')
keyMapping("v", {}, "ms]", "ms[", 'match surround[]:n')
keyMapping("v", {}, "ms<", "s<><ESC>hp", 'match surround<>:n')
keyMapping("v", {}, "ms>", "ms<", 'match surround<>:n')
keyMapping("v", {}, "ms'", "s''<ESC>hp", "match surround'':n")
keyMapping("v", {}, 'ms"', 's""<ESC>hp', 'match surround"":n')
keyMapping("v", {}, "ms<Space>", "s  <ESC>hp", "match surround__:n")

keyMapping("n", {}, "mr(", "di(v%pgvms", 'match replace() => ??')
keyMapping("n", {}, "mr)", "mr(", 'match replace() => ??')
keyMapping("n", {}, "mr{", "di{v%pgvms", 'match replace{} => ??')
keyMapping("n", {}, "mr}", "mr{", 'match replace{} => ??')
keyMapping("n", {}, "mr[", "di[v%pgvms", 'match replace[] => ??')
keyMapping("n", {}, "mr]", "mr[", 'match replace[] => ??')
keyMapping("n", {}, "mr<", "di<vhpgvms", 'match replace<> => ??')
keyMapping("n", {}, "mr>", "mr<", 'match replace<> => ??')
keyMapping("n", {}, "mr'", "di'vhpgvms", "match replace'' => ??")
keyMapping("n", {}, 'mr"', 'di"vhpgvms', 'match replace"" => ??')
keyMapping("n", {}, "mr<Space>", "di<Space>vhpgvms", "match replace__ => ??")
-- }}}

-- Abbreviations {{{
vim.cmd([[
abclear
inoreabbrev $<cpp_random>
      \ template <class T>
      \<NL>T __rand(T mnm, T mxm) {
      \<NL>static std::mt19937 gen((std::random_device())());
      \<NL>return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
      \<NL>}

inoreabbrev $<html_base>
      \ <!DOCTYPE html>
      \<NL><html>
      \<NL><head>
      \<NL><charset="utf-8">
      \<NL><title>Hello World!</title>
      \<NL></head>
      \<NL><body>
      \<NL><h1>Hello World!</h1>
      \<NL></body>
      \<NL></html>
]])
-- }}}

-- Plug-in {{{
-- lazy.nvim install
local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",  -- latest stable release
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- plugin list
require("lazy").setup({
  { "catppuccin/nvim",           name = "catppuccin", priority = 1000 },
  { "nvim-lualine/lualine.nvim", name = "lualine" },
})

-- catppuccin {{{
require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = true, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
vim.cmd("colorscheme catppuccin")
-- }}}

-- lualine {{{
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
-- }}}

-- }}}
