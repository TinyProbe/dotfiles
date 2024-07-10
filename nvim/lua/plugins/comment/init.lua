return {
  "numToStr/Comment.nvim", name = "comment",
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = '^$',
      mappings = {
        basic = true,
        extra = true
      },
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = '<leader>c',
        block = '<leader>b',
      },
      extra = {
        above = '<leader>cO',
        below = '<leader>co',
        eol = '<leader>cA'
      },
      pre_hook = nil,
      post_hook = nil,
    })
  end,
}
