return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
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
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added     = "✚",
            deleted   = "✖",
            modified  = "",
            renamed   = "󰁕",
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
        diagnostics = {
          symbols = {
            hint = "󰌵",
            info = " ",
            warn = " ",
            error = " ",
          },
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          },
        },
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    })
    displayKeymap("n", {desc="File explorer"}, "<leader>fe", "<cmd>Neotree toggle<cr>")
  end,
}
