require("telescope").load_extension("file_browser")
displayKeymap("n", {silent=true, desc="n:telescope file browser"},
  "<leader>fb", "<cmd>Telescope file_browser<CR>")
