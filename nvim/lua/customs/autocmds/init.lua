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

-- INFO: Google style.
--
vim.api.nvim_create_augroup("BufDefault", {})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = {
    "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.js", "*.java",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.cindent = true
    vim.opt_local.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e";
    vim.opt_local.cinoptions = [[
    :0,=s,l1,g0,N-s,E-s,i2s,+2s,(0,U1,W2s,k2s,m1,j1,J1
    ]]
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = { "*.dart" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.cindent = true
    vim.opt_local.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e";
    vim.opt_local.cinoptions = [[
    :0,l1,g0,i2s,+2s,(0,U1,Ws,ks,m1,j1,J1
    ]]
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = { "*.cs" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.cindent = true
    vim.opt_local.cinkeys = "0{,0},0),0],0#,!^F,o,O,e";
    vim.opt_local.cinoptions = [[
    :0,g0,N-s,E-s,+2s,(0,U1,w1,W2s,k2s,m1,j1,J1
    ]]
  end,
})

-- INFO: Microsoft style.
--
-- vim.api.nvim_create_augroup("BufDefault", {})
-- vim.api.nvim_create_autocmd({ "BufEnter", }, {
--   group = "BufDefault",
--   pattern = {
--     "*.c", "*.cc", "*.h", "*.cpp", "*.hpp", "*.cs",
--   },
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.softtabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.cindent = true
--     vim.opt_local.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e";
--     vim.opt_local.cinoptions = [[
--     :0,g0,N-s,E-s,+2s,(0,U1,w1,W2s,k2s,m1,M0,j1,J1
--     ]]
--   end,
-- })
