displayKeymap("n", {desc="File explorer"}, "<leader>fe", "<cmd>Neotree toggle right<cr>")
require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "right",
    width = 32,
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
      }, {
        source = "document_symbols",                          -- string
        display_name = " 󰅩 Symbols "                          -- string | nil
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
