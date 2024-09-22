return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        themeable = true,
        numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
        close_command = "bdelete! %d",
        left_mouse_command = "buffer! %d",
        middle_mouse_command = "bdelete! %d",
        right_mouse_command = nil,
        indicator = {
          icon = '▌', -- this should be omitted if indicator style is not 'icon'
          style = 'icon', -- 'icon' | 'underline' | 'none'
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 16,
        max_prefix_length = 12, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 16,
        diagnostics = false, -- false | "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,  -- need edit
        diagnostics_update_on_event = true, -- use nvim's diagnostic handler
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "(" .. count .. ")"
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer", -- "File Explorer" | function
            text_align = "center", -- "left" | "center" | "right"
            separator = true,
          },
        },
        color_icons = true, -- true | false -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
        end,
        show_buffer_icons = true, -- true | false -- disable filetype icons for buffers
        show_buffer_close_icons = true, -- true | false
        show_close_icon = true, -- true | false
        show_tab_indicators = true, -- true | false
        show_duplicate_prefix = true, -- true | false -- whether to show duplicate buffer prefix
        duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
        enforce_regular_tabs = true, -- false | true
        always_show_bufferline = true, -- true | false
        auto_toggle_bufferline = true, -- true | false
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
        sort_by = 'insert_at_end', -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
      },
    })
  end,
}
