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

displayKeymap("n", {silent=true, desc='Open config:n'    }, "<leader>io", "<cmd>edit ~/.config/nvim/init.lua<cr>")
displayKeymap("n", {silent=true, desc='Reload config:n'  }, "<leader>ir", "<cmd>source ~/.config/nvim/init.lua<cr>")
displayKeymap("n", {silent=true, desc='Buffer list:n'    }, "<leader>bs", "<cmd>buffers<cr>")
displayKeymap("n", {silent=true, desc='Delete buffer:n'  }, "<leader>bd", "<cmd>bdelete<cr>")
displayKeymap("n", {silent=true, desc='Next buffer:n'    }, "<leader>bn", "<cmd>bnext<cr>")
displayKeymap("n", {silent=true, desc='Previous buffer:n'}, "<leader>bp", "<cmd>bprevious<cr>")
displayKeymap("n", {silent=true, desc='First buffer:n'   }, "<leader>bh", "<cmd>bfirst<cr>")
displayKeymap("n", {silent=true, desc='Last buffer:n'    }, "<leader>bl", "<cmd>blast<cr>")
displayKeymap("n", {silent=true, desc='Tab list:n'       }, "<leader>ts", "<cmd>tabs<cr>")
displayKeymap("n", {silent=true, desc='Close tab:n'      }, "<leader>tc", "<cmd>tabclose<cr>")
displayKeymap("n", {silent=true, desc='Next tab:n'       }, "<leader>tn", "<cmd>tabnext<cr>")
displayKeymap("n", {silent=true, desc='Previous tab:n'   }, "<leader>tp", "<cmd>tabprevious<cr>")
displayKeymap("n", {silent=true, desc='First tab:n'      }, "<leader>th", "<cmd>tabfirst<cr>")
displayKeymap("n", {silent=true, desc='Last tab:n'       }, "<leader>tl", "<cmd>tablast<cr>")

displayKeymap("n", {desc='Outdent:n'     }, "<", "<<")
displayKeymap("n", {desc='Indent:n'      }, ">", ">>")
displayKeymap("v", {desc='Outdent line:v'}, "<", "<gv")
displayKeymap("v", {desc='Indent line:v' }, ">", ">gv")
displayKeymap("v", {desc='Outdent line:v'}, "H", "<gv")
displayKeymap("v", {desc='Indent line:v' }, "L", ">gv")

displayKeymap("n", {desc='Move left' }, "h", "<backspace>")
displayKeymap("n", {desc='Move right'}, "l", "<space>")
displayKeymap("v", {desc='Move left' }, "h", "<backspace>")
displayKeymap("v", {desc='Move right'}, "l", "<space>")

displayKeymap("n", {silent=true, desc='Quit with save'   }, "<C-q>q", ":xa<cr>")
displayKeymap("n", {silent=true, desc='Quit without save'}, "<C-q>c", ":qa!<cr>")
displayKeymap("n", {silent=true, desc='Delete buffer:n'  }, "<C-q>b", ":bdelete<cr>")
displayKeymap("n", {silent=true, desc='Close window:n'   }, "<C-q>w", "<C-w>c")
displayKeymap("n", {silent=true, desc='Close tab:n'      }, "<C-q>t", ":tabclose<cr>")

displayKeymap("n", {desc='Goto number[=1] line:n' }, "gk", "gg0zz")
displayKeymap("n", {desc='Goto last line:n'       }, "gj", "G0zz")
displayKeymap("n", {desc='Goto top screen:n'      }, "gt", "H0")
displayKeymap("n", {desc='Goto center screen:n'   }, "gc", "M0")
displayKeymap("n", {desc='Goto bottom screen:n'   }, "gb", "L0")
displayKeymap("n", {desc='Goto first character:n' }, "gs", "_")
displayKeymap("n", {desc='Goto last character:n'  }, "ge", "g_")
displayKeymap("n", {desc='Goto first column:n'    }, "gh", "0")
displayKeymap("n", {desc='Goto last column:n'     }, "gl", "$")
displayKeymap("n", {desc='Goto middle character:n'}, "gm", "gM")
displayKeymap("n", {desc='Goto ???:n'             }, "gM", "gm")
displayKeymap("n", {silent=true, desc='Goto next buffer:n'    }, "gn", ":bnext<cr>zz")
displayKeymap("n", {silent=true, desc='Goto previous buffer:n'}, "gp", ":bprevious<cr>zz")
displayKeymap("v", {desc='Goto number[=1] line:v' }, "gk", "gg0zz")
displayKeymap("v", {desc='Goto last line:v'       }, "gj", "G0zz")
displayKeymap("v", {desc='Goto top screen:v'      }, "gt", "H0")
displayKeymap("v", {desc='Goto center screen:v'   }, "gc", "M0")
displayKeymap("v", {desc='Goto bottom screen:v'   }, "gb", "L0")
displayKeymap("v", {desc='Goto first character:v' }, "gs", "_")
displayKeymap("v", {desc='Goto last character:v'  }, "ge", "g_")
displayKeymap("v", {desc='Goto first column:v'    }, "gh", "0")
displayKeymap("v", {desc='Goto last column:v'     }, "gl", "$")
displayKeymap("v", {desc='Goto middle character:v'}, "gm", "gM")
displayKeymap("v", {desc='Goto ???:v'             }, "gM", "gm")
displayKeymap("v", {silent=true, desc='Goto next buffer:n'    }, "gn", "<esc>:bnext<cr>zz")
displayKeymap("v", {silent=true, desc='Goto previous buffer:n'}, "gp", "<esc>:bprevious<cr>zz")

displayKeymap("n", {desc='Move left unit:n' }, "<C-h>", unit.."<backspace>")
displayKeymap("n", {desc='Move right unit:n'}, "<C-l>", unit.."<space>")
displayKeymap("v", {desc='Move left unit:v' }, "<C-h>", unit.."<backspace>")
displayKeymap("v", {desc='Move right unit:v'}, "<C-l>", unit.."<space>")

displayKeymap("n", {desc='Paste inner word(ignored):n'}, "piw", "viwp")
displayKeymap("n", {desc='Paste inner word(yanked):n' }, "Piw", "viwP")
displayKeymap("n", {desc='Paste back:n' }, "pp", "p")
displayKeymap("n", {desc='Paste front:n'}, "PP", "P")
displayKeymap("v", {desc='Replace to select(ignored):n'}, "p", "P")
displayKeymap("v", {desc='Replace to select(yanked):n' }, "P", "p")
displayKeymap("v", {desc='Undo:n'}, "u", "<esc>u")
displayKeymap("v", {desc='Undo:n'}, "U", "<esc>u")

displayKeymap("n", {desc='Decrease value:n'}, "-", "<C-x>")
displayKeymap("n", {desc='Increase value:n'}, "=", "<C-a>")
displayKeymap("n", {desc='Select all:v'  }, "<C-a>", "GVgg")
displayKeymap("n", {silent=true, desc='Save all buffer:n'}, "<C-s>", ":wa<cr>")
displayKeymap("n", {desc='Yank all:n'    }, "<leader>y", "mqGVggy`qzz")
displayKeymap("n", {desc='Reindention:n' }, "<leader>=", "mqGVgg=`qzz")
displayKeymap("n", {desc='Clear register'}, "<leader>-", '/\\<\\><cr>')
displayKeymap("v", {silent=true, desc='Selected line down:v'}, "J", ":m'>+<cr>gv")
displayKeymap("v", {silent=true, desc='Selected line up:v'  }, "K", ":m-2<cr>gv")

displayKeymap("o", {silent=true, desc='Inner from space'}, "i<space>", ":<C-u>normal lBvhE<cr>")
displayKeymap("v", {silent=true, desc='Inner from space'}, "i<space>", ":<C-u>normal lBvhE<cr>")
displayKeymap("o", {silent=true, desc='Inner characters'}, "ic", ":<C-u>normal _vg_<cr>")
displayKeymap("v", {silent=true, desc='Inner characters'}, "ic", ":<C-u>normal _vg_<cr>")

displayKeymap("v", {desc='Match surround():n'}, "ms(", "s()<esc>hpl%")
displayKeymap("v", {desc='Match surround():n'}, "ms)", "ms(")
displayKeymap("v", {desc='Match surround{}:n'}, "ms{", "s{}<esc>hpl%")
displayKeymap("v", {desc='Match surround{}:n'}, "ms}", "ms{")
displayKeymap("v", {desc='Match surround[]:n'}, "ms[", "s[]<esc>hpl%")
displayKeymap("v", {desc='Match surround[]:n'}, "ms]", "ms[")
displayKeymap("v", {desc='Match surround<>:n'}, "ms<", "s<><esc>hp")
displayKeymap("v", {desc='Match surround<>:n'}, "ms>", "ms<")
displayKeymap("v", {desc="Match surround'':n"}, "ms'", "s''<esc>hp")
displayKeymap("v", {desc='Match surround"":n'}, 'ms"', 's""<esc>hp')
displayKeymap("v", {desc='Match surround__:n'}, "ms ", "s  <esc>hp")

displayKeymap("n", {remap=true, desc='Match replace() => ?'}, "mr(", "di(v%pgvms")
displayKeymap("n", {remap=true, desc='Match replace() => ?'}, "mr)", "mr(")
displayKeymap("n", {remap=true, desc='Match replace{} => ?'}, "mr{", "di{v%pgvms")
displayKeymap("n", {remap=true, desc='Match replace{} => ?'}, "mr}", "mr{")
displayKeymap("n", {remap=true, desc='Match replace[] => ?'}, "mr[", "di[v%pgvms")
displayKeymap("n", {remap=true, desc='Match replace[] => ?'}, "mr]", "mr[")
displayKeymap("n", {remap=true, desc='Match replace<> => ?'}, "mr<", "di<vhpgvms")
displayKeymap("n", {remap=true, desc='Match replace<> => ?'}, "mr>", "mr<")
displayKeymap("n", {remap=true, desc="Match replace'' => ?"}, "mr'", "di'vhpgvms")
displayKeymap("n", {remap=true, desc='Match replace"" => ?'}, 'mr"', 'di"vhpgvms')
displayKeymap("n", {remap=true, desc='Match replace__ => ?'}, "mr ", "di vhpgvms")