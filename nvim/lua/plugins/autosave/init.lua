return {
  "0x00-ketsu/autosave.nvim",
  config = function()
    require("autosave").setup({
      enable = true,
      prompt = {
        enable = true,
        style = 'stdout',
        message = function()
          return 'autosave ' .. vim.fn.strftime('%H:%M:%S')
        end,
      },
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
    displayKeymap("n", {silent=true, desc='Toggle Autosave'}, "<leader>ta", "<cmd>ASToggle<cr>")
  end,
}
