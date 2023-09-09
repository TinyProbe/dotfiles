require("telescope").setup({
  pickers = {
    find_files = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
    buffers = { theme = "dropdown" },
    help_tags = { theme = "dropdown" },
  },
})
local telescope_builtin = require("telescope.builtin")
displayKeymap("n", {desc="Find files"}, "<leader>ff", telescope_builtin.find_files)
displayKeymap("n", {desc="Live grep"}, "<leader>fg", telescope_builtin.live_grep)
displayKeymap("n", {desc="Buffers"}, "<leader>fb", telescope_builtin.buffers)
displayKeymap("n", {desc="Help tags"}, "<leader>fh", telescope_builtin.help_tags)
