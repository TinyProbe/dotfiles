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

-- this convection is google style. shiftwidth: 2
--
vim.api.nvim_create_augroup("BufDefault", {})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = {
    "*.c", "*.cc", "*.h", "*.cpp", "*.hpp",
  },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e";
    vim.opt_local.cinoptions = [[
    Ls,:0.5s,=0.5s,l1,b0,g0.5s,h0.5s,N-s,E-s,i2s,+2s,(0,U1,w1,W2s,k2s,m1,
    M0,j1,J1
    ]]
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", }, {
  group = "BufDefault",
  pattern = { "*.dart", },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cinkeys = "0{,0},0),0],0#,!^F,o,O,e";
    vim.opt_local.cinoptions = [[
    L0,:0,=s,l1,b0,g0,hs,N-s,E-s,i2s,+2s,(0,U1,w1,W2s,k2s,m1,M0,j1,J1
    ]]
  end,
})

-- this convection is microsoft style. shiftwidth: 4
-- 
-- vim.api.nvim_create_augroup("BufDefault", {})
-- vim.api.nvim_create_autocmd({ "BufEnter", }, {
  -- group = "BufDefault",
  -- pattern = {
    -- "*.c", "*.cc", "*.h", "*.cpp", "*.hpp",
  -- },
  -- callback = function()
    -- vim.opt_local.cindent = true
    -- vim.opt_local.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e,0=break;";
    -- vim.opt_local.cinoptions = [[
    -- :0,g0,N-s,E-s,+2s,(0,U1,w1,W2s,k2s,m1,M0,j1,J1
    -- ]]
  -- end,
-- })

-- vim.cmd([[
-- " set comment keyword
-- augroup BufCommentDefault
  -- autocmd!
  -- autocmd BufEnter *.asm
        -- \ let b:comment=";"
  -- autocmd BufEnter *.lua,*.mysql,*.sql
        -- \ let b:comment='--'
  -- autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc,*.cs,*.rs,*.java,*.js,*.php,*.go,*.kt,*.kts,*.dart
        -- \ let b:comment="//"
  -- autocmd BufEnter *.sh,*.py,*.pl,*.rb,*.r,Makefile
        -- \ let b:comment="#"
  -- autocmd BufEnter *.vb
        -- \ let b:comment="'"
  -- autocmd BufEnter *.vim
        -- \ let b:comment='"'
-- augroup end
-- ]])
