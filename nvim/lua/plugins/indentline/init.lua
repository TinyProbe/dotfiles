return {
  "nvimdev/indentmini.nvim",
  config = function()
    require("indentmini").setup({
      char = '▏';
    })
    -- Colors are applied automatically based on user-defined highlight groups.
    -- There is no default value.
    vim.cmd.highlight('IndentLine guifg=#686884')
    -- Current indent line highlight
    vim.cmd.highlight('IndentLineCurrent guifg=orange')
  end,
}
