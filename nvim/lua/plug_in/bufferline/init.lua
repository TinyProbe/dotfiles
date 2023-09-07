local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = "slant",
    right_mouse_command = nil,
    middle_mouse_command = "bdelete! %d",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- diagnostics = true,                    -- need edit
    -- diagnostics_update_in_insert = "coc",  -- need edit
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    -- return "("..count..")"
    -- end,
    style_preset = {
      bufferline.style_preset.no_italic,
    },
    hover = {
      enabled = true,
      delay = 0,
      reveal = { "close" }
    },
  },
})
