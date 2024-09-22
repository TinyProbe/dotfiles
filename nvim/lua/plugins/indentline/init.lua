-- return {
--   "nvimdev/indentmini.nvim",
--   config = function()
--     require("indentmini").setup({
--       char = '▏';
--     })
--     -- Colors are applied automatically based on user-defined highlight groups.
--     -- There is no default value.
--     vim.cmd.highlight('IndentLine guifg=#444864')
--     -- Current indent line highlight
--     vim.cmd.highlight('IndentLineCurrent guifg=orange')
--   end,
-- }

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  config = function()
    local indentline = {
      "IndentLine",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IndentLine", { fg = "#444864" })
    end)
    require('ibl').setup({
      indent = {
        char = '▎',
        highlight = indentline,
      },
      scope = {
        enabled = false,
      },
    })
  end,
}
