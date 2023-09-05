-- Options {{{
vim.opt.background = "dark"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.encoding = "utf-8"
vim.opt.mousemoveevent = true
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
    vim.opt_local.cinoptions = ":s,l1,g0,(s,us,U1,Ws,m1,j1,J1"
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
keyMapping("v", {}, "<", "<gv", 'outdent-line:v')
keyMapping("v", {}, ">", ">gv", 'indent-line:v')
keyMapping("v", {}, "H", "<gv", 'outdent-line:v')
keyMapping("v", {}, "L", ">gv", 'indent-line:v')

keyMapping("n", {}, "h", "<BS>", 'move left')
keyMapping("n", {}, "l", "<Space>", 'move right')
keyMapping("v", {}, "h", "<BS>", 'move left')
keyMapping("v", {}, "l", "<Space>", 'move right')

keyMapping("n", { silent=true }, "<C-q>q", ":xa<CR>", 'quit with save')
keyMapping("n", { silent=true }, "<C-q>c", ":qa!<CR>", 'quit without save')
keyMapping("n", { silent=true }, "<C-q>b", ":bdelete<CR>", 'delete buffer:n')
keyMapping("n", {}, "<C-q>w", "<C-w>c", 'close window:n')
keyMapping("n", { silent=true }, "<C-q>t", ":tabclose<CR>", 'close tab:n')

keyMapping("n", {}, "gk", "gg0zz", 'goto number[=1] line:n')
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
keyMapping("v", {}, "gk", "gg0zz", 'goto number[=1] line:v')
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
keyMapping("v", { silent=true }, "J", ":m'>+<CR>gv", 'selected line down:v')
keyMapping("v", { silent=true }, "K", ":m-2<CR>gv", 'selected line up:v')

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

keyMapping("n", { remap=true }, "mr(", "di(v%pgvms", 'match replace() => ??')
keyMapping("n", { remap=true }, "mr)", "mr(", 'match replace() => ??')
keyMapping("n", { remap=true }, "mr{", "di{v%pgvms", 'match replace{} => ??')
keyMapping("n", { remap=true }, "mr}", "mr{", 'match replace{} => ??')
keyMapping("n", { remap=true }, "mr[", "di[v%pgvms", 'match replace[] => ??')
keyMapping("n", { remap=true }, "mr]", "mr[", 'match replace[] => ??')
keyMapping("n", { remap=true }, "mr<", "di<vhpgvms", 'match replace<> => ??')
keyMapping("n", { remap=true }, "mr>", "mr<", 'match replace<> => ??')
keyMapping("n", { remap=true }, "mr'", "di'vhpgvms", "match replace'' => ??")
keyMapping("n", { remap=true }, 'mr"', 'di"vhpgvms', 'match replace"" => ??')
keyMapping("n", { remap=true }, "mr<Space>", "di<Space>vhpgvms", "match replace__ => ??")
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

-- Plugins {{{
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
    "akinsho/bufferline.nvim",                          name =     "bufferline",
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
    dependencies = { 'nvim-lua/plenary.nvim' },
  }, {  -- =====================================================================
    "nvim-treesitter/nvim-treesitter",                  name =     "treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  }, {  -- =====================================================================
    "neovim/nvim-lspconfig",                            name =      "lspconfig",
  }, {  -- =====================================================================
    "numToStr/Comment.nvim",                            name =        "Comment",
    lazy = false,
  },    -- =====================================================================
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
  no_underline = false, -- Force no underline
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

-- bufferline {{{
local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    style_preset = {
      bufferline.style_preset.no_italic,
    },
    right_mouse_command = nil,
    middle_mouse_command = "bdelete! %d",
    separator_style = "thick",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 0,
      reveal = { "close" }
    },
  },
})
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

-- neo-tree {{{
keyMapping("n", {}, "<Leader>fe", ":Neotree toggle right<CR>", "file explorer:n")
require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    width = 30,
    mappings = {
      ["<Space>"] = "noop",
      ["t"] = "toggle_node",
      ["T"] = "open_tabnew",
      ["l"] = "open",
      ["L"] = "focus_preview",
      ["C"] = "noop",
      ["h"] = "close_node",
    },
  },
  buffers = {
    follow_current_file = { enabled = true },
  },
  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = { "node_modules" },
      never_show = {
        -- ".DS_Store",
        -- "thumbs.db",
      },
    },
  },
  source_selector = {
    winbar = true, -- toggle to show selector on winbar
    statusline = true, -- toggle to show selector on statusline
    show_scrolled_off_parent_node = true,                    -- boolean
    sources = {                                               -- table
      {
        source = "filesystem",                                -- string
        display_name = " 󰉓 Files "                            -- string | nil
      }, {
        source = "buffers",                                   -- string
        display_name = " 󰈚 Buffers "                          -- string | nil
      }, {
        source = "git_status",                                -- string
        display_name = " 󰊢 Git "                              -- string | nil
      },
    },
    content_layout = "start",                                 -- string
    tabs_layout = "equal",                                    -- string
    truncation_character = "…",                               -- string
    tabs_min_width = nil,                                     -- int | nil
    tabs_max_width = nil,                                     -- int | nil
    padding = 0,                                              -- int | { left: int, right: int }
    separator = { left = "▏", right= "▕" },                   -- string | { left: string, right: string, override: string | nil }
    separator_active = nil,                                   -- string | { left: string, right: string, override: string | nil } | nil
    show_separator_on_edge = false,                           -- boolean
    highlight_tab = "NeoTreeTabInactive",                     -- string
    highlight_tab_active = "NeoTreeTabActive",                -- string
    highlight_background = "NeoTreeTabInactive",              -- string
    highlight_separator = "NeoTreeTabSeparatorInactive",      -- string
    highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
  },
})
-- }}}

-- telescope {{{
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
require('telescope').setup({
  pickers = {
    find_files = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
    buffers = { theme = "dropdown" },
    help_tags = { theme = "dropdown" },
  },
})
-- }}}

-- treesitter {{{
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = { "c", "lua", "rust" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  -- List of parsers to ignore installing (or "all")
  ignore_install = {},
  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  highlight = {
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
      -- local max_filesize = 100 * 1024 -- 100 KB
      -- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      -- if ok and stats and stats.size > max_filesize then
        -- return true
      -- end
    -- end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
-- }}}

-- lspconfig {{{

-- }}}

-- Comment {{{
require("Comment").setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = "<Leader>/l",
    ---Block-comment toggle keymap
    block = "<Leader>/b",
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = "<Leader>/l",
    ---Block-comment keymap
    block = "<Leader>/b",
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = "<Leader>/O",
    ---Add comment on the line below
    below = "<Leader>/o",
    ---Add comment at the end of line
    eol = "<Leader>/A",
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
  },
  ---Function to call before (un)comment
  pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,
})
-- }}}

-- }}}
