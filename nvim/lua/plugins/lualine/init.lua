return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local mode = {
      'mode',
      fmt = function(str)
        return str .. ' '
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }
    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
      symbols = {
        modified = '',     -- Text to show when the file is modified.
        readonly = '',     -- Text to show when the file is non-modifiable or readonly.
        unnamed = '󱥸',      -- Text to show for unnamed buffers.
        newfile = '',      -- Text to show for newly created file before first write
      }
    }
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = '', warn = '', info = '', hint = '' },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }
    local diff = {
      'diff',
      colored = false,
      symbols = { added = '', modified = '', removed = '' }, -- changes diff symbols
      cond = hide_in_width,
    }
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto', -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --          
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = {
          diagnostics, diff, 'filetype', { 'encoding', cond = hide_in_width },
          { 'fileformat', cond = hide_in_width },  
        },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    })
  end,
}
