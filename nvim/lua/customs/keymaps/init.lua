vim.cmd('mapclear')
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local unit = 5

displayKeymap("",  {desc='Prevent key'}, "<C-q>", "<nop>")
displayKeymap("",  {desc='Prevent key'}, "<up>", "<nop>")
displayKeymap("",  {desc='Prevent key'}, "<down>", "<nop>")
displayKeymap("",  {desc='Prevent key'}, "<left>", "<nop>")
displayKeymap("",  {desc='Prevent key'}, "<right>", "<nop>")
displayKeymap("",  {desc='Prevent key'}, "gg", "<nop>")
displayKeymap("",  {desc='Prevent key'}, "G", "<nop>")
displayKeymap("n", {desc='Prevent key'}, "p", "<nop>")
displayKeymap("n", {desc='Prevent key'}, "P", "<nop>")

-- displayKeymap("n", {silent=true, desc='Open config'    }, "<leader>io", "<cmd>edit ~/.config/nvim/init.lua<cr>")
-- displayKeymap("n", {silent=true, desc='Reload config'  }, "<leader>ir", "<cmd>source ~/.config/nvim/init.lua<cr>")
displayKeymap("n", {silent=true, desc='Buffer list'    }, "<leader>bs", "<cmd>buffers<cr>")
displayKeymap("n", {silent=true, desc='Delete buffer'  }, "<leader>bd", "<cmd>bdelete<cr>")
displayKeymap("n", {silent=true, desc='Next buffer'    }, "<leader>bn", "<cmd>bnext<cr>")
displayKeymap("n", {silent=true, desc='Previous buffer'}, "<leader>bp", "<cmd>bprevious<cr>")
displayKeymap("n", {silent=true, desc='First buffer'   }, "<leader>bh", "<cmd>bfirst<cr>")
displayKeymap("n", {silent=true, desc='Last buffer'    }, "<leader>bl", "<cmd>blast<cr>")
displayKeymap("n", {silent=true, desc='Tab list'       }, "<leader><tab>s", "<cmd>tabs<cr>")
displayKeymap("n", {silent=true, desc='Close tab'      }, "<leader><tab>c", "<cmd>tabclose<cr>")
displayKeymap("n", {silent=true, desc='Next tab'       }, "<leader><tab>n", "<cmd>tabnext<cr>")
displayKeymap("n", {silent=true, desc='Previous tab'   }, "<leader><tab>p", "<cmd>tabprevious<cr>")
displayKeymap("n", {silent=true, desc='First tab'      }, "<leader><tab>h", "<cmd>tabfirst<cr>")
displayKeymap("n", {silent=true, desc='Last tab'       }, "<leader><tab>l", "<cmd>tablast<cr>")
displayKeymap("n", {desc='Go to the left window'    }, "<leader>wh", "<C-w>h")
displayKeymap("n", {desc='Go to the down window'    }, "<leader>wj", "<C-w>j")
displayKeymap("n", {desc='Go to the up window'      }, "<leader>wk", "<C-w>k")
displayKeymap("n", {desc='Go to the right window'   }, "<leader>wl", "<C-w>l")
displayKeymap("n", {desc='Close current window'     }, "<leader>wc", "<C-w>c")
displayKeymap("n", {desc='Switch windows'           }, "<leader>ww", "<C-w>w")
displayKeymap("n", {desc='Swap current with next'   }, "<leader>wx", "<C-w>x")
displayKeymap("n", {desc='Split window horizontally'}, "<leader>ws", "<C-w>s")
displayKeymap("n", {desc='Split window vertically'  }, "<leader>wv", "<C-w>v")

displayKeymap("n", {desc='Outdent'     }, "<", "<<")
displayKeymap("n", {desc='Indent'      }, ">", ">>")
displayKeymap("v", {desc='Outdent line'}, "<", "<gv")
displayKeymap("v", {desc='Indent line' }, ">", ">gv")

-- displayKeymap("n", {desc='Move left' }, "h", "<backspace>")
-- displayKeymap("n", {desc='Move right'}, "l", "<space>")
-- displayKeymap("v", {desc='Move left' }, "h", "<backspace>")
-- displayKeymap("v", {desc='Move right'}, "l", "<space>")

displayKeymap("n", {silent=true, desc='Quit with save'   }, "<leader>qq", ":xa<cr>")
displayKeymap("n", {silent=true, desc='Quit without save'}, "<leader>qc", ":qa!<cr>")
displayKeymap("n", {silent=true, desc='Delete buffer'    }, "<leader>qb", ":bdelete<cr>")
displayKeymap("n", {silent=true, desc='Close window'     }, "<leader>qw", "<C-w>c")
displayKeymap("n", {silent=true, desc='Close tab'        }, "<leader>qt", ":tabclose<cr>")

displayKeymap("n", {desc='Go to first line'      }, "gk", "ggzz")
displayKeymap("n", {desc='Go to last line'       }, "gj", "Gzz")
displayKeymap("n", {desc='Go to top screen'      }, "gt", "H")
displayKeymap("n", {desc='Go to center screen'   }, "gc", "M")
displayKeymap("n", {desc='Go to bottom screen'   }, "gb", "L")
displayKeymap("n", {desc='Go to first character' }, "gs", "_")
displayKeymap("n", {desc='Go to last character'  }, "ge", "g_")
displayKeymap("n", {desc='Go to first column'    }, "gh", "0")
displayKeymap("n", {desc='Go to last column'     }, "gl", "$")
displayKeymap("n", {desc='Go to middle character'}, "gm", "gM")
displayKeymap("n", {desc='Go to ...'             }, "gM", "gm")
displayKeymap("n", {silent=true, desc='Go to next buffer'    }, "gn", ":bnext<cr>zz")
displayKeymap("n", {silent=true, desc='Go to previous buffer'}, "gp", ":bprevious<cr>zz")
displayKeymap("v", {desc='Go to first line'      }, "gk", "ggzz")
displayKeymap("v", {desc='Go to last line'       }, "gj", "Gzz")
displayKeymap("v", {desc='Go to top screen'      }, "gt", "H")
displayKeymap("v", {desc='Go to center screen'   }, "gc", "M")
displayKeymap("v", {desc='Go to bottom screen'   }, "gb", "L")
displayKeymap("v", {desc='Go to first character' }, "gs", "_")
displayKeymap("v", {desc='Go to last character'  }, "ge", "g_")
displayKeymap("v", {desc='Go to first column'    }, "gh", "0")
displayKeymap("v", {desc='Go to last column'     }, "gl", "$")
displayKeymap("v", {desc='Go to middle character'}, "gm", "gM")
displayKeymap("v", {desc='Go to ...'             }, "gM", "gm")
displayKeymap("v", {silent=true, desc='Go to next buffer'    }, "gn", "<esc>:bnext<cr>zzv")
displayKeymap("v", {silent=true, desc='Go to previous buffer'}, "gp", "<esc>:bprevious<cr>zzv")

displayKeymap("n", {desc='Move left unit' }, "<C-h>", (unit * 2) .. "zh")
displayKeymap("n", {desc='Move right unit'}, "<C-l>", (unit * 2) .. "zl")
displayKeymap("n", {desc='Move left unit' }, "<C-j>", (unit) .. "<C-e>")
displayKeymap("n", {desc='Move right unit'}, "<C-k>", (unit) .. "<C-y>")
displayKeymap("v", {desc='Move left unit' }, "<C-h>", (unit * 2) .. "zh")
displayKeymap("v", {desc='Move right unit'}, "<C-l>", (unit * 2) .. "zl")
displayKeymap("v", {desc='Move left unit' }, "<C-j>", (unit) .. "<C-e>")
displayKeymap("v", {desc='Move right unit'}, "<C-k>", (unit) .. "<C-y>")

displayKeymap("n", {desc='Paste inner word(ignored)'}, "piw", "viwP")
displayKeymap("n", {desc='Paste inner word(yanked)' }, "Piw", "viwp")
displayKeymap("n", {desc='Paste back' }, "pp", "p")
displayKeymap("n", {desc='Paste front'}, "PP", "P")
displayKeymap("v", {desc='Replace to select(ignored)'}, "p", "P")
displayKeymap("v", {desc='Replace to select(yanked)' }, "P", "p")
displayKeymap("v", {desc='Undo'}, "u", "<esc>u")
displayKeymap("v", {desc='Undo'}, "U", "<esc>u")

displayKeymap("n", {desc='Decrease value'}, "-", "<C-x>")
displayKeymap("n", {desc='Increase value'}, "=", "<C-a>")
displayKeymap("n", {desc='Select all'    }, "<C-a>", "GVgg")
displayKeymap("n", {desc='Yank all'      }, "<leader>y", "mqGVggy`qzz")
displayKeymap("n", {desc='Reindention'   }, "<leader>=", "mqGVgg=`qzz")
displayKeymap("n", {desc='Clear register'}, "<leader>-", '/\\<\\><cr>')
displayKeymap("n", {silent=true, desc='Save all buffer'   }, "<C-s>", ":wa<cr>")
displayKeymap("n", {silent=true, desc='Selected line down'}, "<A-j>", "V:m'>+<cr>")
displayKeymap("n", {silent=true, desc='Selected line up'  }, "<A-k>", "V:m-2<cr>")
displayKeymap("n", {desc='Outdent line'}, "<A-h>", "<<")
displayKeymap("n", {desc='Indent line' }, "<A-l>", ">>")
displayKeymap("v", {silent=true, desc='Selected line down'}, "<A-j>", ":m'>+<cr>gv")
displayKeymap("v", {silent=true, desc='Selected line up'  }, "<A-k>", ":m-2<cr>gv")
displayKeymap("v", {desc='Outdent line'}, "<A-h>", "<gv")
displayKeymap("v", {desc='Indent line' }, "<A-l>", ">gv")

displayKeymap("o", {silent=true, desc='Inner from space'}, "i<space>", ":<C-u>normal lBvhE<cr>")
displayKeymap("v", {silent=true, desc='Inner from space'}, "i<space>", ":<C-u>normal lBvhE<cr>")
displayKeymap("o", {silent=true, desc='Inner characters'}, "ic", ":<C-u>normal _vg_<cr>")
displayKeymap("v", {silent=true, desc='Inner characters'}, "ic", ":<C-u>normal _vg_<cr>")

-- displayKeymap("v", {desc='Match surround()'}, "ms(", "s()<esc>hpl%")
-- displayKeymap("v", {remap=true, desc='Match surround()'}, "ms)", "ms(")
-- displayKeymap("v", {desc='Match surround{}'}, "ms{", "s{}<esc>hpl%")
-- displayKeymap("v", {remap=true, desc='Match surround{}'}, "ms}", "ms{")
-- displayKeymap("v", {desc='Match surround[]'}, "ms[", "s[]<esc>hpl%")
-- displayKeymap("v", {remap=true, desc='Match surround[]'}, "ms]", "ms[")
-- displayKeymap("v", {desc='Match surround<>'}, "ms<", "s<><esc>hp")
-- displayKeymap("v", {remap=true, desc='Match surround<>'}, "ms>", "ms<")
-- displayKeymap("v", {desc="Match surround''"}, "ms'", "s''<esc>hp")
-- displayKeymap("v", {desc='Match surround""'}, 'ms"', 's""<esc>hp')
-- displayKeymap("v", {desc='Match surround__'}, "ms ", "s  <esc>hp")

-- displayKeymap("n", {remap=true, desc='Match replace() => ?'}, "mr(", "di(v%pgvms")
-- displayKeymap("n", {remap=true, desc='Match replace() => ?'}, "mr)", "mr(")
-- displayKeymap("n", {remap=true, desc='Match replace{} => ?'}, "mr{", "di{v%pgvms")
-- displayKeymap("n", {remap=true, desc='Match replace{} => ?'}, "mr}", "mr{")
-- displayKeymap("n", {remap=true, desc='Match replace[] => ?'}, "mr[", "di[v%pgvms")
-- displayKeymap("n", {remap=true, desc='Match replace[] => ?'}, "mr]", "mr[")
-- displayKeymap("n", {remap=true, desc='Match replace<> => ?'}, "mr<", "di<vhpgvms")
-- displayKeymap("n", {remap=true, desc='Match replace<> => ?'}, "mr>", "mr<")
-- displayKeymap("n", {remap=true, desc="Match replace'' => ?"}, "mr'", "di'vhpgvms")
-- displayKeymap("n", {remap=true, desc='Match replace"" => ?'}, 'mr"', 'di"vhpgvms')
-- displayKeymap("n", {remap=true, desc='Match replace__ => ?'}, "mr ", "di vhpgvms")
