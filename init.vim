" Vim Default Setting {{{
" Latest version .vimrc base file.
" An example for a vimrc file.
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change: 2019 Dec 17
"
" To use it, copy it to
"        for Unix:  ~/.vimrc
"       for Amiga:  s:.vimrc
"  for MS-Windows:  $VIM\_vimrc
"       for Haiku:  ~/config/settings/vim/vimrc
"     for OpenVMS:  sys$login:.vimrc
filetype off                          "Activate indentation
filetype plugin indent on
set background=dark                   " Useful settings
set clipboard=unnamed,unnamedplus
set nocompatible                      " Disable vi-compatibility
set encoding=utf-8                    " Real-world encoding
set modelines=1                       " Interpret modelines in files
set hidden                            " Do not abandon buffers
set ttyfast                           " Don't bother throttling tty
set backspace=indent,eol,start        " More useful backspace behavior
set laststatus=2                      " Use statusbar on all windows
set ignorecase                        " Better search
set smartcase
set incsearch
set showmatch
set hlsearch

" Prevent backups when editing system files
augroup PreventBackup
  autocmd!
  autocmd BufWrite /private/tmp/crontab.* set nowritebackup
  autocmd BufWrite /private/etc/pw.* set nowritebackup
augroup end

" When started as "evim", evim.vim will already have done these settings, bail
" out.
" if v:progname =~? "evim"
  " finish
" endif

" if has("vms")
  " set nobackup                " do not keep a backup file, use versions instead
" else
  " set backup                  " keep a backup file (restore to previous version)
  " if has('persistent_undo')
    " set undofile              " keep an undo file (undo changes after closing)
  " endif
" endif

" if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  " set hlsearch
" endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
" if has('syntax') && has('eval')
  " packadd! matchit
" endif
" }}}

" Options {{{
set splitbelow splitright
set wildmenu
set autoread
set smartindent
set autoindent
set smarttab
set expandtab
set title
set number
set relativenumber
set colorcolumn=80
set cursorline
set cursorcolumn
set mouse=a
set notimeout
set noshowmode
set showtabline
set nowrap
set nobackup
set noswapfile
set undofile
set undodir=~/.cache/nvim/undo
set undolevels=4096
set softtabstop=2
set tabstop=2
set shiftwidth=2
set scrolloff=6
set sidescrolloff=9
set termguicolors
set list
set listchars=tab:→·
set fillchars=eob:\ 
set foldcolumn=auto
set foldmethod=marker
" set foldexpr=GetFold(v:lnum)

syntax on
colorscheme onehalfdark
" }}}

" Status Line {{{
set statusline=\ NORMAL\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
highlight StatusLine guifg=#cbcbcd guibg=#116faf
augroup StatusLineCmd
  autocmd!
  autocmd ModeChanged *:n :set statusline=\ NORMAL\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:i :set statusline=\ INSERT\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:[vV\x16]* :set statusline=\ VISUAL\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:s :set statusline=\ SELECT\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:R :set statusline=\ REPLACE\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:o :set statusline=\ O-PENDING\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:c :set statusline=\ COMMAND\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:t :set statusline=\ TERMINAL\ \ %n:\ %F%m\ %=\ %l:%v\ \ %p%%\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:n :highlight StatusLine guibg=#116faf
  autocmd ModeChanged *:i :highlight StatusLine guibg=#588339
  autocmd ModeChanged *:[vV\x16]* :highlight StatusLine guibg=#86389d
  autocmd ModeChanged *:s :highlight StatusLine guibg=#86388d
  autocmd ModeChanged *:R :highlight StatusLine guibg=#a5803b
  autocmd ModeChanged *:o :highlight StatusLine guibg=#a02c35
  " autocmd ModeChanged *:c :highlight StatusLine guibg=#1676a2
  autocmd ModeChanged *:t :highlight StatusLine guibg=#1676a2
augroup end
" }}}

" Auto Commands {{{
augroup BufDefault
  autocmd!
  autocmd BufNewFile * :write
  autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cs,*.rs,*.java,*.js,*.php,*.go,*.kt,*.kts
        \ :setlocal cindent
        \|:setlocal cinkeys+=0=break;
        \|:setlocal cinoptions=:s,l1,b1,g0,(s,us,U1,Ws,m1,j1,J1
  " set comment keyword
  autocmd BufEnter *.asm
        \ let b:comment=";"
  autocmd BufEnter *.lua,*.mysql,*.sql
        \ let b:comment='--'
  autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cs,*.rs,*.java,*.js,*.php,*.go,*.kt,*.kts
        \ let b:comment="//"
  autocmd BufEnter *.sh,*.py,*.pl,*.rb,*.r,Makefile
        \ let b:comment="#"
  autocmd BufEnter *.vb
        \ let b:comment="'"
  autocmd BufEnter *.vim
        \ let b:comment='"'
augroup end
" }}}

" Functions {{{
function! CommentToggle()
  let l:frontline=trim(getline(line('.')))[0:strlen(b:comment)-1]
  if l:frontline == b:comment
    execute "normal! _".(strlen(b:comment)+1)."x"
  elseif strlen(l:frontline) != 0
    execute "normal! I".b:comment." \<ESC>"
  endif
endfunction

" mapping key with display description(if format is correctly)
" a:desc[ "_:..." | "...:_" ]: _[n|v|i]: what a mode when just before echo
" left: do echo before action, right: do echo after action
function! Mapping(mode, option, key, act, desc)
  let l:command=""
  if a:desc[1:1]==":" && stridx("nvi", a:desc[0:0])!=-1
    let l:command=":echo '".a:desc[2:]."'<CR>"
    if a:desc[0:0]=="v"
      let l:command="<ESC>".l:command."gv"
    elseif a:desc[0:0]=="i"
      let l:command="<ESC>`^".l:command."i"
    endif
    let l:command=l:command.a:act
  elseif a:desc[-2:-2]==":" && stridx("nvi", a:desc[-1:-1])!=-1
    let l:command=":echo '".a:desc[:-3]."'<CR>"
    if a:desc[-1:-1]=="v"
      let l:command="<ESC>".l:command."gv"
    elseif a:desc[-1:-1]=="i"
      let l:command="<ESC>`^".l:command."i"
    endif
    let l:command=a:act.l:command
  else
    let l:command=a:act
  endif
  execute a:mode."map ".a:option." ".a:key." ".l:command
endfunction
" }}}

" Key Mappings {{{
mapclear
let g:unit=5
let mapleader=" "
let maplocalleader='\'

call Mapping("nore", "", "<C-q>", "<NOP>", 'prevent key')
call Mapping("nore", "", "<Up>", "<NOP>", 'prevent key')
call Mapping("nore", "", "<Down>", "<NOP>", 'prevent key')
call Mapping("nore", "", "<Left>", "<NOP>", 'prevent key')
call Mapping("nore", "", "<Right>", "<NOP>", 'prevent key')
call Mapping("nore", "", "gg", "<NOP>", 'prevent key')
call Mapping("nore", "", "G", "<NOP>", 'prevent key')
call Mapping("nnore", "", "p", "<NOP>", 'prevent key')
call Mapping("nnore", "", "P", "<NOP>", 'prevent key')

call Mapping("nnore", "<silent>", "<Leader>co", ":edit ~/.config/nvim/init.vim<CR>", 'open config:n')
call Mapping("nnore", "<silent>", "<Leader>cr", ":source ~/.config/nvim/init.vim<CR>", 'reload config:n')
call Mapping("nnore", "<silent>", "<Leader>fe", ":edit .<CR>", 'file explorer:n')
call Mapping("nnore", "<silent>", "<Leader>bs", ":buffers<CR>", 'buffer list:n')
call Mapping("nnore", "<silent>", "<Leader>bd", ":bdelete<CR>", 'delete buffer:n')
call Mapping("nnore", "<silent>", "<Leader>bn", ":bnext<CR>", 'next buffer:n')
call Mapping("nnore", "<silent>", "<Leader>bp", ":bprevious<CR>", 'previous buffer:n')
call Mapping("nnore", "<silent>", "<Leader>bh", ":bfirst<CR>", 'first buffer:n')
call Mapping("nnore", "<silent>", "<Leader>bl", ":blast<CR>", 'last buffer:n')
call Mapping("nnore", "<silent>", "<Leader>ts", ":tabs<CR>", 'tab list:n')
call Mapping("nnore", "<silent>", "<Leader>tc", ":tabclose<CR>", 'close tab:n')
call Mapping("nnore", "<silent>", "<Leader>tn", ":tabnext<CR>", 'next tab:n')
call Mapping("nnore", "<silent>", "<Leader>tp", ":tabprevious<CR>", 'previous tab:n')
call Mapping("nnore", "<silent>", "<Leader>th", ":tabfirst<CR>", 'first tab:n')
call Mapping("nnore", "<silent>", "<Leader>tl", ":tablast<CR>", 'last tab:n')

call Mapping("nnore", "", "<", "<<", 'outdent:n')
call Mapping("nnore", "", ">", ">>", 'indent:n')
call Mapping("vnore", "", "<", "<gv", 'outdent-line')
call Mapping("vnore", "", ">", ">gv", 'indent-line')
call Mapping("vnore", "", "H", "<gv", 'outdent-line')
call Mapping("vnore", "", "L", ">gv", 'indent-line')

call Mapping("nnore", "", "h", "<BS>", 'move left')
call Mapping("nnore", "", "l", "<Space>", 'move right')
call Mapping("vnore", "", "h", "<BS>", 'move left')
call Mapping("vnore", "", "l", "<Space>", 'move right')

call Mapping("nnore", "<silent>", "<C-q>q", ":xa<CR>", 'quit with save')
call Mapping("nnore", "<silent>", "<C-q>c", ":qa!<CR>", 'quit without save')
call Mapping("nnore", "<silent>", "<C-q>b", ":bdelete<CR>", 'delete buffer:n')
call Mapping("nnore", "", "<C-q>w", "<C-w>c", 'close window:n')
call Mapping("nnore", "<silent>", "<C-q>t", ":tabclose<CR>", 'close tab:n')

call Mapping("nnore", "", "gk", "gg0", 'goto top-line:n')
call Mapping("nnore", "", "gj", "G0zz", 'goto bottom-line:n')
call Mapping("nnore", "", "gt", "H0", 'goto top-screen:n')
call Mapping("nnore", "", "gc", "M0", 'goto center-screen:n')
call Mapping("nnore", "", "gb", "L0", 'goto bottom-screen:n')
call Mapping("nnore", "", "gs", "_", 'goto first character:n')
call Mapping("nnore", "", "ge", "g_", 'goto last character:n')
call Mapping("nnore", "", "gh", "0", 'goto first column:n')
call Mapping("nnore", "", "gl", "$", 'goto last column:n')
call Mapping("nnore", "", "gm", "gM", 'goto middle character:n')
call Mapping("nnore", "", "gM", "gm", 'goto ???:n')
call Mapping("nnore", "<silent>", "gn", ":bnext<CR>zz", 'goto next buffer:n')
call Mapping("nnore", "<silent>", "gp", ":bprevious<CR>zz", 'goto previous buffer:n')
call Mapping("vnore", "", "gk", "gg0", 'goto top-line:v')
call Mapping("vnore", "", "gj", "G0zz", 'goto bottom-line:v')
call Mapping("vnore", "", "gt", "H0", 'goto top-screen:v')
call Mapping("vnore", "", "gc", "M0", 'goto center-screen:v')
call Mapping("vnore", "", "gb", "L0", 'goto bottom-screen:v')
call Mapping("vnore", "", "gs", "_", 'goto first character:v')
call Mapping("vnore", "", "ge", "g_", 'goto last character:v')
call Mapping("vnore", "", "gh", "0", 'goto first column:v')
call Mapping("vnore", "", "gl", "$", 'goto last column:v')
call Mapping("vnore", "", "gm", "gM", 'goto middle character:v')
call Mapping("vnore", "", "gM", "gm", 'goto ???:v')

call Mapping("n",     "", "<C-h>", g:unit."h", 'move left unit:n')
call Mapping("n",     "", "<C-l>", g:unit."l", 'move right unit:n')
call Mapping("nnore", "", "<C-j>", g:unit."<C-e>", 'move scroll down unit:n')
call Mapping("nnore", "", "<C-k>", g:unit."<C-y>", 'move scroll up unit:n')
call Mapping("v",     "", "<C-h>", g:unit."h", 'move left unit')
call Mapping("v",     "", "<C-l>", g:unit."l", 'move right unit')
call Mapping("vnore", "", "<C-j>", g:unit."<C-e>", 'move scroll down unit')
call Mapping("vnore", "", "<C-k>", g:unit."<C-y>", 'move scroll up unit')

call Mapping("n", "", "piw", "viwp", 'paste inner word(ignored)')
call Mapping("n", "", "Piw", "viwP", 'paste inner word(yanked)')
call Mapping("nnore", "", "pp", "p", 'paste back:n')
call Mapping("nnore", "", "PP", "P", 'paste front:n')
call Mapping("vnore", "", "p", "P", 'replace to select(ignored):n')
call Mapping("vnore", "", "P", "p", 'replace to select(yanked):n')
call Mapping("vnore", "", "u", "<ESC>u", 'undo:n')
call Mapping("vnore", "", "U", "<ESC>u", 'undo:n')

call Mapping("nnore", "", "-", "<C-x>", 'decrease value:n')
call Mapping("nnore", "", "=", "<C-a>", 'increase value:n')
call Mapping("nnore", "", "<C-a>", "GVgg", 'n:select all')
call Mapping("nnore", "<silent>", "<C-s>", ":wa<CR>", 'save all:n')
call Mapping("nnore", "", "<Leader>y", "mqGVggy`q", 'yank all:n')
call Mapping("nnore", "", "<Leader>=", "mqGVgg=`q", 'indentation all:n')
call Mapping("nnore", "", "<Leader>-", '/\<\><CR>', 'clear register')
call Mapping("vnore", "<silent>", "J", ":m'>+<CR>gv", 'selected line down')
call Mapping("vnore", "<silent>", "K", ":m-2<CR>gv", 'selected line up')
call Mapping("nnore", "<silent>", "<Leader>/", "mq:call CommentToggle()<CR>`q", 'toggle comment:n')
call Mapping("vnore", "<silent>", "<Leader>/", "mq:call CommentToggle()<CR>`q", 'toggle comment:n')

call Mapping("onore", "<silent>", "i<Space>", ":<C-u>normal lBvhE<CR>", 'inner from space')
call Mapping("vnore", "<silent>", "i<Space>", ":<C-u>normal lBvhE<CR>", 'inner from space')
call Mapping("onore", "<silent>", "ic", ":<C-u>normal _vg_<CR>", 'inner characters')
call Mapping("vnore", "<silent>", "ic", ":<C-u>normal _vg_<CR>", 'inner characters')
call Mapping("onore", "<silent>", "il", ":<C-u>normal 0v$<CR>", 'inner line')
call Mapping("vnore", "<silent>", "il", ":<C-u>normal 0v$<CR>", 'inner line')

call Mapping("vnore", "", "ms(", "s()<ESC>hpl%", 'match surround():n')
call Mapping("v",     "", "ms)", "ms(", 'match surround():n')
call Mapping("vnore", "", "ms{", "s{}<ESC>hpl%", 'match surround{}:n')
call Mapping("v",     "", "ms}", "ms{", 'match surround{}:n')
call Mapping("vnore", "", "ms[", "s[]<ESC>hpl%", 'match surround[]:n')
call Mapping("v",     "", "ms]", "ms[", 'match surround[]:n')
call Mapping("vnore", "", "ms<", "s<><ESC>hp", 'match surround<>:n')
call Mapping("v",     "", "ms>", "ms<", 'match surround<>:n')
call Mapping("vnore", "", "ms'", "s''<ESC>hp", "match surround'':n")
call Mapping("vnore", "", 'ms"', 's""<ESC>hp', 'match surround"":n')
call Mapping("vnore", "", "ms<Space>", "s  <ESC>hp", "match surround__:n")

call Mapping("n", "", "mr(", "di(v%pgvms", 'match replace() => ??')
call Mapping("n", "", "mr)", "mr(", 'match replace() => ??')
call Mapping("n", "", "mr{", "di{v%pgvms", 'match replace{} => ??')
call Mapping("n", "", "mr}", "mr{", 'match replace{} => ??')
call Mapping("n", "", "mr[", "di[v%pgvms", 'match replace[] => ??')
call Mapping("n", "", "mr]", "mr[", 'match replace[] => ??')
call Mapping("n", "", "mr<", "di<vhpgvms", 'match replace<> => ??')
call Mapping("n", "", "mr>", "mr<", 'match replace<> => ??')
call Mapping("n", "", "mr'", "di'vhpgvms", "match replace'' => ??")
call Mapping("n", "", 'mr"', 'di"vhpgvms', 'match replace"" => ??')
call Mapping("n", "", "mr<Space>", "di<Space>vhpgvms", "match replace__ => ??")
" }}}

" Abbreviations {{{
abclear
iabbrev $<cpp_random>
      \ template <class T>
      \<NL>T __rand(T mnm, T mxm) {
      \<NL>static std::mt19937 gen((std::random_device())());
      \<NL>return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
      \<NL>}

iabbrev $<html_base>
      \ <!DOCTYPE html>
      \<NL><html>
      \<NL><head>
      \<NL><charset="utf-8">
      \<NL><title>Hello World!</title>
      \<NL></head>
      \<NL><body>
      \<NL><h1>Hello World!</h1>
      \<NL></body>
      \<NL></html>
" }}}
