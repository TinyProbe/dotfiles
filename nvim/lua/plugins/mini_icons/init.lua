return {
  "echasnovski/mini.icons", name = "mini_icons",
  config = function()
    require("mini.icons").setup({
      -- Icon style: 'glyph' or 'ascii'
      style = 'glyph',

      -- Customize per category. See `:h MiniIcons.config` for details.
      default   = {},
      directory = {},
      extension = {},
      file      = {},
      filetype  = {},
      lsp       = {},
      os        = {},
    })
  end,
}
