local which_key = require("which-key")
-- local telescope_builtin = require("telescope.builtin")
-- local unit = 5
which_key.register({
  -- ["<leader>"] = {
  --   ["i"] = {
  --     ["o"] = { mode="n", silent=true, "<cmd>edit ~/.config/nvim/init.lua<cr>", "Open config" },
  --     ["r"] = { mode="n", silent=true, "<cmd>source ~/.config/nvim/init.lua<cr>", "Reload config" },
  --   },
  --   ["b"] = {
  --     ["s"] = { mode="n", silent=true, "<cmd>buffers<cr>", "Buffer list" },
  --     ["d"] = { mode="n", silent=true, "<cmd>bdelete<cr>", "Delete buffer" },
  --     ["n"] = { mode="n", silent=true, "<cmd>bnext<cr>", "Next buffer" },
  --     ["p"] = { mode="n", silent=true, "<cmd>bprevious<cr>", "Previous buffer" },
  --     ["h"] = { mode="n", silent=true, "<cmd>bfirst<cr>", "First buffer" },
  --     ["l"] = { mode="n", silent=true, "<cmd>blast<cr>", "Last buffer" },
  --   },
  --   ["t"] = {
  --     ["s"] = { mode="n", silent=true, "<cmd>tabs<cr>", "Tab list" },
  --     ["c"] = { mode="n", silent=true, "<cmd>tabclose<cr>", "Close tab" },
  --     ["n"] = { mode="n", silent=true, "<cmd>tabnext<cr>", "Next tab" },
  --     ["p"] = { mode="n", silent=true, "<cmd>tabprevious<cr>", "Previous tab" },
  --     ["h"] = { mode="n", silent=true, "<cmd>tabfirst<cr>", "First tab" },
  --     ["l"] = { mode="n", silent=true, "<cmd>tablast<cr>", "Last tab" },
  --   },
  --   ["f"] = {
  --     ["f"] = { mode="n", telescope_builtin.find_files, "Find files" },
  --     ["g"] = { mode="n", telescope_builtin.live_grep, "Live grep" },
  --     ["b"] = { mode="n", telescope_builtin.buffers, "Buffers" },
  --     ["h"] = { mode="n", telescope_builtin.help_tags, "Help tags" },
  --     ["b"] = { mode="n", silent=true, "<cmd>Telescope file_browser<CR>", "TFbrowser" },
  --   },
  --   ["y"] = { mode="n", "mqGVggy`qzz", "Yank all" },
  --   ["="] = { mode="n", "mqGVgg=`qzz", "Reindention" },
  --   ["-"] = { mode="n", "/\\<\\><cr>", "Clear register" },
  -- },
  --
  -- ["<"] = { mode="n", "<<", "Outdent" },
  -- [">"] = { mode="n", ">>", "Indent" },
  -- ["<"] = { mode="v", "<", "Outdent line" },
  -- [">"] = { mode="v", ">", "Indent line" },
  -- ["H"] = { mode="v", "<", "Outdent line" },
  -- ["L"] = { mode="v", ">", "Indent line" },
  --
  -- ["h"] = { mode="n", "<backspace>", "Move left" },
  -- ["l"] = { mode="n", "<space>", "Move right" },
  -- ["h"] = { mode="v", "<backspace>", "Move left" },
  -- ["l"] = { mode="v", "<space>", "Move right" },
  --
  -- ["<C-q>"] = {
  --   ["q"] = { mode="n", silent=true, "<cmd>xa<cr>", "Quit with save" },
  --   ["c"] = { mode="n", silent=true, "<cmd>qa!<cr>", "Quit without save" },
  --   ["b"] = { mode="n", silent=true, "<cmd>bdelete<cr>", "Delete buffer" },
  --   ["w"] = { mode="n", silent=true, "<C-w>c", "Close window" },
  --   ["t"] = { mode="n", silent=true, "<cmd>tabclose<cr>", "Close tab" },
  -- },
  --
  -- ["g"] = {
  --   ["k"] = { mode="n", "gg0zz", "Goto number[=1] line" },
  --   ["j"] = { mode="n", "G0zz", "Goto last line" },
  --   ["t"] = { mode="n", "H0", "Goto top line" },
  --   ["c"] = { mode="n", "M0", "Goto center line" },
  --   ["b"] = { mode="n", "L0", "Goto bottom line" },
  --   ["s"] = { mode="n", "_", "Goto first character" },
  --   ["e"] = { mode="n", "g_", "Goto last character" },
  --   ["h"] = { mode="n", "0", "Goto first column" },
  --   ["l"] = { mode="n", "$", "Goto last column" },
  --   ["m"] = { mode="n", "gM", "Goto middle character" },
  --   ["M"] = { mode="n", "gm", "Goto ???" },
  --   ["n"] = { mode="n", silent=true, "<cmd>bnext<cr>zz", "Goto next buffer" },
  --   ["p"] = { mode="n", silent=true, "<cmd>bprevious<cr>zz", "Goto previous buffer" },
  --   ["k"] = { mode="v", "gg0zz", "Goto number[=1] line" },
  --   ["j"] = { mode="v", "G0zz", "Goto last line" },
  --   ["t"] = { mode="v", "H0", "Goto top line" },
  --   ["c"] = { mode="v", "M0", "Goto center line" },
  --   ["b"] = { mode="v", "L0", "Goto bottom line" },
  --   ["s"] = { mode="v", "_", "Goto first character" },
  --   ["e"] = { mode="v", "g_", "Goto last character" },
  --   ["h"] = { mode="v", "0", "Goto first column" },
  --   ["l"] = { mode="v", "$", "Goto last column" },
  --   ["m"] = { mode="v", "gM", "Goto middle character" },
  --   ["M"] = { mode="v", "gm", "Goto ???" },
  --   ["n"] = { mode="v", silent=true, "<cmd>bnext<cr>zz", "Goto next buffer" },
  --   ["p"] = { mode="v", silent=true, "<cmd>bprevious<cr>zz", "Goto previous buffer" },
  -- },
  --
  -- ["<C-h>"] = { mode="n", unit.."<backspace>", "Move left unit" },
  -- ["<C-l>"] = { mode="n", unit.."<space>", "Move right unit" },
  -- ["<C-h>"] = { mode="v", unit.."<backspace>", "Move left unit" },
  -- ["<C-l>"] = { mode="v", unit.."<space>", "Move right unit" },
  -- ["p"] = {
  --   mode="v", "P", "Replace to select(ignore)",
  --   ["p"] = { mode="n", "p", "Paste back" },
  --   ["i"] = {
  --     ["w"] = { mode="n", "viwp", "Paste inner word(ignore)" },
  --   },
  -- },
  -- ["P"] = {
  --   mode="v", "p", "Replace to select(yank)",
  --   ["P"] = { mode="n", "P", "Paste front" },
  --   ["i"] = {
  --     ["w"] = { mode="n", "viwP", "Paste inner word(yank)" },
  --   },
  -- },
  -- ["u"] = { mode="v", "<esc>u", "Undo" },
  -- ["U"] = { mode="v", "<esc>u", "Undo" },
  --
  -- ["-"] = { mode="n", "<C-x>", "Decrease value" },
  -- ["="] = { mode="n", "<C-a>", "Increase value" },
  -- ["<C-a>"] = { mode="n", "GVgg", "Select all" },
  -- ["<C-s>"] = { mode="n", silent=true, "<cmd>wa<cr>", "Save all buffer" },
  -- ["J"] = { mode="v", silent=true, "<cmd>m'>+<cr>gv", "Selected line up" },
  -- ["K"] = { mode="v", silent=true, "<cmd>m-2<cr>gv", "Selected line down" },
  --
  -- ["i<space>"] = { mode="o", silent=true, "<cmd><C-u>normal lBvhE<cr>", "Inner from space" },
  -- ["i<space>"] = { mode="v", silent=true, "<cmd><C-u>normal lBvhE<cr>", "Inner from space" },
  -- ["ic"] = { mode="o", silent=true, "<cmd><C-u>normal _vg_<cr>", "Inner characters" },
  -- ["ic"] = { mode="v", silent=true, "<cmd><C-u>normal _vg_<cr>", "Inner characters" },
  --
  -- ["m"] = {
  --   ["s"] = {
  --     ["("] = { mode="v", "s()<esc>hpl%", "Match surround()" },
  --     ["{"] = { mode="v", "s{}<esc>hpl%", "Match surround{}" },
  --     ["["] = { mode="v", "s[]<esc>hpl%", "Match surround[]" },
  --     ["<"] = { mode="v", "s<><esc>hp",   "Match surround<>" },
  --     [")"] = { mode="v", noremap=false, "ms(", "Match surround()" },
  --     ["}"] = { mode="v", noremap=false, "ms{", "Match surround{}" },
  --     ["]"] = { mode="v", noremap=false, "ms[", "Match surround[]" },
  --     [">"] = { mode="v", noremap=false, "ms<", "Match surround<>" },
  --     ["'"] = { mode="v", "s''<esc>hp", "Match surround''" },
  --     ['"'] = { mode="v", 's""<esc>hp', 'Match surround""' },
  --     [" "] = { mode="v", "s  <esc>hp", "Match surround__" },
  --   },
  --   ["r"] = {
  --     ["("] = { mode="n", noremap=false, "di(v%pgvms", "Match replace() => ?" },
  --     ["{"] = { mode="n", noremap=false, "di{v%pgvms", "Match replace{} => ?" },
  --     ["["] = { mode="n", noremap=false, "di[v%pgvms", "Match replace[] => ?" },
  --     ["<"] = { mode="n", noremap=false, "di<vhpgvms", "Match replace<> => ?" },
  --     [")"] = { mode="n", noremap=false, "mr(", "Match replace() => ?" },
  --     ["}"] = { mode="n", noremap=false, "mr{", "Match replace{} => ?" },
  --     ["]"] = { mode="n", noremap=false, "mr[", "Match replace[] => ?" },
  --     [">"] = { mode="n", noremap=false, "mr<", "Match replace<> => ?" },
  --     ["'"] = { mode="n", noremap=false, "di'vhpgvms", "Match replace'' => ?" },
  --     ['"'] = { mode="n", noremap=false, 'di"vhpgvms', 'Match replace"" => ?' },
  --     [" "] = { mode="n", noremap=false, "di vhpgvms", "Match replace__ => ?" },
  --   },
  -- },
})
which_key.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
})
