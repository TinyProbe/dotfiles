return {
  "nvimdev/indentmini.nvim",
  config = function()
    require("indentmini").setup({
      char = '▏';
    })
    -- Colors are applied automatically based on user-defined highlight groups.
    -- There is no default value.
    vim.cmd.highlight('IndentLine guifg=#444466')
    -- Current indent line highlight
    vim.cmd.highlight('IndentLineCurrent guifg=#dd9966')
  end,
}
