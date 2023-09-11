vim.api.nvim_create_augroup("vimrcEx", {})
vim.api.nvim_create_autocmd({ "FileType", }, {
  group = "vimrcEx",
  pattern = { "text" },
  callback = function()
    vim.opt_local.textwidth = 78
  end,
})

vim.api.nvim_create_augroup("PreventBackupPrivate", {})
vim.api.nvim_create_autocmd({ "BufWrite", }, {
  group = "PreventBackupPrivate",
  pattern = { "/private/tmp/crontab.*", "/private/etc/pw.*", },
  callback = function()
    vim.opt_local.writebackup = false
  end,
})

vim.api.nvim_create_augroup("BufDefault", {})
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
  group = "BufDefault",
  pattern = { "*" },
  callback = function()
    vim.cmd("write")
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = {
    "*.c", "*.h", "*.cpp", "*.hpp", "*.cs", "*.rs", "*.java", "*.js",
    "*.php", "*.go", "*.kt", "*.kts",
  },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cinoptions = ":s,l1,g0,(s,us,U1,Ws,m1,j1,J1"
  end,
})
