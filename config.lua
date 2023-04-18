--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- vim.opt.guifont = "monaco:h17" -- the font used in graphical neovim applications
vim.opt.guicursor = "a:hor25-blinkwait300" -- the cursor shape's definitions
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.smarttab = true -- make tab smarter again
vim.opt.autoindent = true
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 0 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 0 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.softtabstop = 4
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 12
vim.opt.list = true
vim.opt.listchars = "tab:→·"
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "catppuccin-frappe"
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.highlights.background.italic = false
lvim.builtin.bufferline.highlights.buffer_selected.bold = true
lvim.builtin.bufferline.highlights.buffer_selected.italic = false
lvim.builtin.indentlines.options.enabled = false
lvim.builtin.autopairs.active = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["\\lt"] = ":LspStop<CR>"
lvim.keys.normal_mode["\\ls"] = ":LspStart<CR>"
lvim.keys.normal_mode["\\lr"] = ":LspRestart<CR>"
lvim.keys.normal_mode["\\co"] = "<Cmd>edit /Users/tiny/.config/lvim/config.lua<CR>"

lvim.keys.normal_mode["<"] = "<<"
lvim.keys.normal_mode[">"] = ">>"
lvim.keys.visual_mode["<"] = "<gv"
lvim.keys.visual_mode[">"] = ">gv"
lvim.keys.normal_mode["<Tab>"] = ">>"
lvim.keys.normal_mode["<S-Tab>"] = "<<"
lvim.keys.visual_mode["<Tab>"] = ">gv"
lvim.keys.visual_mode["<S-Tab>"] = "<gv"
lvim.keys.visual_mode["H"] = "<gv"
lvim.keys.visual_mode["L"] = ">gv"

lvim.keys.normal_mode["<C-q>"] = false
lvim.keys.normal_mode["<C-q>q"] = ":xa<CR>"
lvim.keys.normal_mode["<C-q>c"] = ":qa!<CR>"
lvim.keys.normal_mode["<C-q>b"] = ":bdelete<CR>"
lvim.keys.normal_mode["<C-q>w"] = "<C-w>c"
lvim.keys.normal_mode["<C-q>t"] = ":tabclose<CR>"

lvim.lsp.buffer_mappings.normal_mode["gd"] = nil
lvim.lsp.buffer_mappings.normal_mode["gs"] = nil
lvim.lsp.buffer_mappings.normal_mode["gl"] = nil
lvim.keys.normal_mode["gg"] = "gg0"
lvim.keys.normal_mode["ge"] = "G0"
lvim.keys.normal_mode["gu"] = "H0"
lvim.keys.normal_mode["gm"] = "M0"
lvim.keys.normal_mode["gd"] = "L0"
lvim.keys.normal_mode["gs"] = "^"
lvim.keys.normal_mode["gh"] = "0"
lvim.keys.normal_mode["gl"] = "$"
lvim.keys.normal_mode["gn"] = ":bnext<CR>zz"
lvim.keys.normal_mode["gp"] = ":bprevious<CR>zz"
lvim.keys.visual_mode["gg"] = "gg0"
lvim.keys.visual_mode["ge"] = "G0"
lvim.keys.visual_mode["gu"] = "H0"
lvim.keys.visual_mode["gm"] = "M0"
lvim.keys.visual_mode["gd"] = "L0"
lvim.keys.visual_mode["gs"] = "^"
lvim.keys.visual_mode["gh"] = "0"
lvim.keys.visual_mode["gl"] = "$"
lvim.keys.visual_mode["gn"] = ":bnext<CR>zz"
lvim.keys.visual_mode["gp"] = ":bprevious<CR>zz"

lvim.keys.normal_mode["<C-h>"] = "3h"
lvim.keys.normal_mode["<C-l>"] = "3l"
lvim.keys.normal_mode["<C-j>"] = "3<C-e>"
lvim.keys.normal_mode["<C-k>"] = "3<C-y>"
lvim.keys.visual_mode["<C-h>"] = "3h"
lvim.keys.visual_mode["<C-l>"] = "3l"
lvim.keys.visual_mode["<C-j>"] = "3<C-e>"
lvim.keys.visual_mode["<C-k>"] = "3<C-y>"

lvim.keys.normal_mode["piw"] = "lbveP"
lvim.keys.normal_mode["pp"] = "p"
lvim.keys.normal_mode["PP"] = "P"
lvim.keys.normal_mode["-"] = "<C-x>"
lvim.keys.normal_mode["="] = "<C-a>"
lvim.keys.normal_mode["<C-a>"] = "GVgg"
lvim.keys.normal_mode["<C-s>"] = ":wa<CR>"
lvim.keys.normal_mode["<C-b>s"] = ":buffers<CR>"
lvim.keys.normal_mode["<C-b>d"] = ":bdelete<CR>"
lvim.keys.normal_mode["<C-b>l"] = ":bnext<CR>"
lvim.keys.normal_mode["<C-b>h"] = ":bprevious<CR>"
lvim.keys.normal_mode["<C-b>j"] = ":blast<CR>"
lvim.keys.normal_mode["<C-b>k"] = ":bfirst<CR>"
lvim.keys.normal_mode["<C-t>s"] = ":tabs<CR>"
lvim.keys.normal_mode["<C-t>c"] = ":tabclose<CR>"
lvim.keys.normal_mode["<C-t>l"] = ":tabnext<CR>"
lvim.keys.normal_mode["<C-t>h"] = ":tabprevious<CR>"
lvim.keys.normal_mode["<C-t>j"] = ":tablast<CR>"
lvim.keys.normal_mode["<C-t>k"] = ":tabfirst<CR>"
lvim.keys.normal_mode["<C-t>t"] = ":tabnew<CR>:terminal<CR>i"
lvim.keys.normal_mode["<C-w>t"] = ":new<CR>:terminal<CR>i"
lvim.keys.visual_mode["J"] = ":m'>+<CR>gv"
lvim.keys.visual_mode["K"] = ":m-2<CR>gv"
lvim.keys.visual_mode["ms("] = "s()<ESC>hpl%"
lvim.keys.visual_mode["ms)"] = "s(  )<ESC>hhpll%"
lvim.keys.visual_mode["ms{"] = "s{}<ESC>hpl%"
lvim.keys.visual_mode["ms}"] = "s{  }<ESC>hhpll%"
lvim.keys.visual_mode["ms["] = "s[]<ESC>hpl%"
lvim.keys.visual_mode["ms]"] = "s[  ]<ESC>hhpll%"
lvim.keys.visual_mode["ms<"] = "s<><ESC>hp"
lvim.keys.visual_mode["ms>"] = "s<  ><ESC>hhp"
lvim.keys.visual_mode["ms'"] = "s''<ESC>hp"
lvim.keys.visual_mode["ms\""] = "s\"\"<ESC>hp"
lvim.keys.visual_mode["/"] = ":norm i//<CR>"
lvim.keys.visual_mode["?"] = ":norm 2x<CR>"
lvim.keys.visual_mode["p"] = "P"
lvim.keys.visual_mode["P"] = "p"
lvim.keys.visual_mode["u"] = "<ESC>u"
lvim.keys.visual_mode["U"] = "<ESC>u"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

lvim.builtin.treesitter = {
	ensure_installed = "all",
	sync_install = true,
	ignore_install = { "", },
	highlight = {
		enable = true,
		disable = { "", },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = false,
		disable = { "yaml", "make", "toml", },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	playground = {
		enable = true,
		disable = { "", },
		updatetime = 0,
		persist_queries = false,
	},
}

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "olimorris/onedarkpro.nvim", name = "onedarkpro" },
	{ "NLKNguyen/papercolor-theme", name = "papercolor" },
	{ "sainnhe/everforest", name = "everforest" },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
