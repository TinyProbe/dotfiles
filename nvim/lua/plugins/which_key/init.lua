local which_key = require("which-key")
which_key.register({
  ["<leader>"] = { name = "global keymaps" },
  ["<leader>b"] = { name = "buffer" },
  ["<leader>t"] = { name = "tab" },
  ["<leader>f"] = { name = "file" },
  ["<leader>c"] = { name = "comment" },
  ["<leader>i"] = { name = "init" },
  ["<leader>q"] = { name = "quit" },
  ["m"] = { name = "match" },
  ["ms"] = { mode = "v", name = "surround" },
  ["mr"] = { name = "replace" },
  ["g"] = { name = "goto" },
}, {})
which_key.setup({})
