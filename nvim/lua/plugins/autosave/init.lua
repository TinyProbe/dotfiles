return {
  "0x00-ketsu/autosave.nvim", name = "autosave",
  config = function()
    require("autosave").setup({
      enable = true,
      prompt_style = 'stdout',
      prompt_message = function()
        return 'autosave '..vim.fn.strftime('%H:%M:%S')
      end,
      events = {'InsertLeave', 'TextChanged'},
      conditions = {
        exists = true,
        modifiable = true,
        filename_is_not = {},
        filetype_is_not = {}
      },
      write_all_buffers = false,
      debounce_delay = 0
    })
    displayKeymap("n", {silent=true, desc='Toggle autosave'}, "<leader>ts", "<cmd>ASToggle<cr>")
  end,
}
