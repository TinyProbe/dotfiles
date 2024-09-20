return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = "helix",
    delay = 0,
    spec = {
      { "<leader>", group = "Global" },
      { "<leader>b", group = "Buffer" },
      { "<leader>t", group = "Toggle" },
      { "<leader>w", group = "Window" },
      { "<leader>f", group = "File" },
      { "<leader>c", group = "Comment" },
      { "<leader>l", group = "Lazy" },
      { "<leader>q", group = "Quit" },
      { "<leader><tab>", group = "Tab" },
      { "g", group = "Goto" },
      { "m", mode = "v", group = "Match" },
      { "m", group = "Match" },
      { "ms", mode = "v", group = "Surround" },
      { "mr", mode = "n", group = "Replace" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
