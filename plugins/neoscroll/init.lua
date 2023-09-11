return {
  "karb94/neoscroll.nvim", name = "neoscroll",
  config = function()
    require("neoscroll").setup({
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {
        "<C-u>", "<C-d>",
        "<C-b>", "<C-f>",
        "<C-k>", "<C-j>",
        "zt", "zz", "zb",
      },
      hide_cursor = false,         -- Hide cursor while scrolling
      stop_eof = false,            -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil,       -- Default easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil,             -- Function to run after the scrolling animation ends
      performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    })
    require("neoscroll.config").set_mappings({
      ["<C-u>"] = {"scroll", {"-vim.wo.scroll", "false", "50"}},
      ["<C-d>"] = {"scroll", { "vim.wo.scroll", "false", "50"}},
      ["<C-b>"] = {"scroll", {"-vim.api.nvim_win_get_height(0)", "false", "100"}},
      ["<C-f>"] = {"scroll", { "vim.api.nvim_win_get_height(0)", "false", "100"}},
      ["<C-k>"] = {"scroll", {"-0.1", "false", "25"}},
      ["<C-j>"] = {"scroll", { "0.1", "false", "25"}},
      ["zt"]    = {"zt", {"50"}},
      ["zz"]    = {"zz", {"50"}},
      ["zb"]    = {"zb", {"50"}},
    })
  end,
}
