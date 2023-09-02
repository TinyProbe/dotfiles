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
augroup PreventPrivate
  autocmd!
  autocmd BufWrite /private/tmp/crontab.* set nowritebackup
  autocmd BufWrite /private/etc/pw.* set nowritebackup
augroup end

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

if has("vms")
  set nobackup                " do not keep a backup file, use versions instead
else
  set backup                  " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile              " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

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
if has('syntax') && has('eval')
  packadd! matchit
endif
" }}}

" Options {{{
set splitbelow splitright
set ttimeoutlen=0
set wildmenu
set noshowmode
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
set nowrap
set nobackup
set undofile
set undodir=~/.cache/nvim/undo
set undolevels=4096
set noswapfile
set softtabstop=2
set tabstop=2
set shiftwidth=2
set scrolloff=6
set sidescrolloff=9
set termguicolors
set list
set listchars=tab:→·
set fillchars=eob:\ 
set foldmethod=marker
set foldcolumn=auto

syntax on
colorscheme onehalfdark
" }}}

" Status Line {{{
set statusline=\ NORMAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
highlight StatusLine guifg=#cbcbcd guibg=#116faf
augroup StatusLineCmd
  autocmd!
  autocmd ModeChanged *:n :set statusline=\ NORMAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:i :set statusline=\ INSERT\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:[vV\x16]* :set statusline=\ VISUAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:s :set statusline=\ SELECT\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:R :set statusline=\ REPLACE\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:o :set statusline=\ O-PENDING\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:c :set statusline=\ COMMAND\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:t :set statusline=\ TERMINAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
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
  autocmd BufEnter *.c,*.cpp,*.rs
        \ :setlocal cindent
        \|:setlocal cinkeys+=0=break;
        \|:setlocal cinoptions=:s,l1,b1,g0,(s,us,U1,Ws,m1,j1,J1
  " set comment keyword
  autocmd BufEnter *.c,*.cpp,*.rs
        \ let b:comment="//"
  autocmd BufEnter *.py
        \ let b:comment="#"
  autocmd BufEnter *.vim
        \ let b:comment="\""
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

function! Mapping(mode, key, act, desc)
  let l:echo_desc=""
  if a:desc[:0] == ":"
    let l:echo_desc=":echo '".a:desc[1:]."'<CR>"
  endif
  execute a:mode."map ".a:key." ".a:act.l:echo_desc
endfunction
" }}}

" Key Mappings {{{
mapclear
let g:unit=5
let mapleader=" "
let maplocalleader='\'

call Mapping("nore", "<C-q>", "<NOP>", "prevent useless key")
call Mapping("nore", "<Up>", "<NOP>", "prevent useless key")
call Mapping("nore", "<Down>", "<NOP>", "prevent useless key")
call Mapping("nore", "<Left>", "<NOP>", "prevent useless key")
call Mapping("nore", "<Right>", "<NOP>", "prevent useless key")
call Mapping("nnore", "p", "<NOP>", "prevent useless key")
call Mapping("nnore", "P", "<NOP>", "prevent useless key")

call Mapping("nnore", "<Leader>cr", ":source ~/.config/nvim/init.vim<CR>", ":reload config")
call Mapping("nnore", "<Leader>co", ":edit ~/.config/nvim/init.vim<CR>", ":open config")
call Mapping("nnore", "<Leader>fe", ":edit .<CR>", ":file explorer")
call Mapping("nnore", "<Leader>bs", ":buffers<CR>", ":buffer list")
call Mapping("nnore", "<Leader>bd", ":bdelete<CR>", ":delete buffer")
call Mapping("nnore", "<Leader>bn", ":bnext<CR>", ":next buffer")
call Mapping("nnore", "<Leader>bp", ":bprevious<CR>", ":previous buffer")
call Mapping("nnore", "<Leader>bh", ":bfirst<CR>", ":first buffer")
call Mapping("nnore", "<Leader>bl", ":blast<CR>", ":last buffer")
call Mapping("nnore", "<Leader>ts", ":tabs<CR>", ":tab list")
call Mapping("nnore", "<Leader>tc", ":tabclose<CR>", ":close tab")
call Mapping("nnore", "<Leader>tn", ":tabnext<CR>", ":next tab")
call Mapping("nnore", "<Leader>tp", ":tabprevious<CR>", ":previous tab")
call Mapping("nnore", "<Leader>th", ":tabfirst<CR>", ":first tab")
call Mapping("nnore", "<Leader>tl", ":tablast<CR>", ":last tab")

call Mapping("nnore", "<", "<<", ":outdent")
call Mapping("nnore", ">", ">>", ":indent")
call Mapping("vnore", "<", "<gv", "outdent-line")
call Mapping("vnore", ">", ">gv", "indent-line")
call Mapping("vnore", "H", "<gv", "outdent-line")
call Mapping("vnore", "L", ">gv", "indent-line")

call Mapping("nnore", "h", "<BS>", "move left")
call Mapping("nnore", "l", "<Space>", "move right")
call Mapping("vnore", "h", "<BS>", "move left")
call Mapping("vnore", "l", "<Space>", "move right")

call Mapping("nnore", "<C-q>q", ":xa<CR>", "quit with save")
call Mapping("nnore", "<C-q>c", ":qa!<CR>", "quit without save")
call Mapping("nnore", "<C-q>b", ":bdelete<CR>", ":delete buffer")
call Mapping("nnore", "<C-q>w", "<C-w>c", ":close window")
call Mapping("nnore", "<C-q>t", ":tabclose<CR>", ":close tab")

call Mapping("nnore", "gk", "gg0", ":goto top-line")
call Mapping("nnore", "gj", "G0zz", ":goto bottom-line")
call Mapping("nnore", "gt", "H0", ":goto top-screen")
call Mapping("nnore", "gc", "M0", ":goto center-screen")
call Mapping("nnore", "gb", "L0", ":goto bottom-screen")
call Mapping("nnore", "gs", "_", ":goto first character")
call Mapping("nnore", "ge", "g_", ":goto last character")
call Mapping("nnore", "gh", "0", ":goto first column")
call Mapping("nnore", "gl", "$", ":goto last column")
call Mapping("nnore", "gm", "gM", ":goto middle character")
call Mapping("nnore", "gM", "gm", ":goto ???")
call Mapping("nnore", "gn", ":bnext<CR>zz", ":goto next buffer")
call Mapping("nnore", "gp", ":bprevious<CR>zz", ":goto previous buffer")
call Mapping("vnore", "gk", "gg0", "goto top-line")
call Mapping("vnore", "gj", "G0zz", "goto bottom-line")
call Mapping("vnore", "gt", "H0", "goto top-screen")
call Mapping("vnore", "gc", "M0", "goto center-screen")
call Mapping("vnore", "gb", "L0", "goto bottom-screen")
call Mapping("vnore", "gs", "_", "goto first character")
call Mapping("vnore", "ge", "g_", "goto last character")
call Mapping("vnore", "gh", "0", "goto first column")
call Mapping("vnore", "gl", "$", "goto last column")
call Mapping("vnore", "gm", "gM", "goto middle character")
call Mapping("vnore", "gM", "gm", "goto ???")

call Mapping("n", "<C-h>", g:unit."h", ":move left unit")
call Mapping("n", "<C-l>", g:unit."l", ":move right unit")
call Mapping("nnore", "<C-j>", g:unit."<C-e>", ":move scroll down unit")
call Mapping("nnore", "<C-k>", g:unit."<C-y>", ":move scroll up unit")
call Mapping("v", "<C-h>", g:unit."h", "move left unit")
call Mapping("v", "<C-l>", g:unit."l", "move right unit")
call Mapping("vnore", "<C-j>", g:unit."<C-e>", "move scroll down unit")
call Mapping("vnore", "<C-k>", g:unit."<C-y>", "move scroll up unit")

call Mapping("n", "piw", "viwp", "paste inner word(ignored)")
call Mapping("n", "Piw", "viwP", "paste inner word(yanked)")
call Mapping("nnore", "pp", "p", ":paste back")
call Mapping("nnore", "PP", "P", ":paste front")
call Mapping("vnore", "p", "P", ":paste to select(ignored)")
call Mapping("vnore", "P", "p", ":paste to select(yanked)")
call Mapping("vnore", "u", "<ESC>u", ":undo")
call Mapping("vnore", "U", "<ESC>u", ":undo")

call Mapping("nnore", "-", "<C-x>", ":decrease value")
call Mapping("nnore", "=", "<C-a>", ":increase value")
call Mapping("nnore", "<C-a>", "GVgg", "select all")
call Mapping("n", "<Leader>y", "mq<C-a>y`q", ":yank all")
call Mapping("nnore", "<C-s>", ":wa<CR>", ":save all")
call Mapping("vnore", "J", ":m'>+<CR>gv", "selected line down")
call Mapping("vnore", "K", ":m-2<CR>gv", "selected line up")
call Mapping("nnore", "<Leader>/", "mq:call CommentToggle()<CR>`q", ":toggle comment")
call Mapping("vnore", "<Leader>/", "mq:call CommentToggle()<CR>`q", ":toggle comment")

call Mapping("onore", "i<Space>", ":<C-u>normal lBvhE<CR>", "inner from space")
call Mapping("vnore", "i<Space>", ":<C-u>normal lBvhE<CR>", "inner from space")
call Mapping("onore", "ic", ":<C-u>normal _vg_<CR>", "inner characters")
call Mapping("vnore", "ic", ":<C-u>normal _vg_<CR>", "inner characters")
call Mapping("onore", "il", ":<C-u>normal 0v$<CR>", "inner line")
call Mapping("vnore", "il", ":<C-u>normal 0v$<CR>", "inner line")

call Mapping("vnore", "ms(", "s()<ESC>hpl%", ":match surround()")
call Mapping("v", "ms)", "ms(", ":match surround()")
call Mapping("vnore", "ms{", "s{}<ESC>hpl%", ":match surround{}")
call Mapping("v", "ms}", "ms{", ":match surround{}")
call Mapping("vnore", "ms[", "s[]<ESC>hpl%", ":match surround[]")
call Mapping("v", "ms]", "ms[", ":match surround[]")
call Mapping("vnore", "ms<", "s<><ESC>hp", ":match surround<>")
call Mapping("v", "ms>", "ms<", ":match surround<>")
call Mapping("vnore", "ms'", "s''<ESC>hp", ":match surround''")
call Mapping("vnore", 'ms"', 's""<ESC>hp', ':match surround""')
call Mapping("vnore", "ms<Space>", "s  <ESC>hp", ":match surround__")

call Mapping("n", "mr(", "di(v%pgvms", "match replace() => ??")
call Mapping("n", "mr)", "mr(", "match replace() => ??")
call Mapping("n", "mr{", "di{v%pgvms", "match replace{} => ??")
call Mapping("n", "mr}", "mr{", "match replace{} => ??")
call Mapping("n", "mr[", "di[v%pgvms", "match replace[] => ??")
call Mapping("n", "mr]", "mr[", "match replace[] => ??")
call Mapping("n", "mr<", "di<vhpgvms", "match replace<> => ??")
call Mapping("n", "mr>", "mr<", "match replace<> => ??")
call Mapping("n", "mr'", "di'vhpgvms", "match replace'' => ??")
call Mapping("n", 'mr"', 'di"vhpgvms', 'match replace"" => ??')
call Mapping("n", 'mr<Space>', 'di<Space>vhpgvms', 'match replace__ => ??')
" }}}

" Abbreviations {{{
iabbrev $<tiny>
      \ template <class T>
      \<NL>T const &min(T const &a, T const &b) {
      \<NL>return (a<b ? a : b);
      \<NL>}
      \<NL>template <class T>
      \<NL>T const &max(T const &a, T const &b) {
      \<NL>return (a>b ? a : b);
      \<NL>}
      \<NL>template <class T>
      \<NL>T __rand(T mnm, T mxm) {
      \<NL>static std::mt19937 gen((std::random_device())());
      \<NL>return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
      \<NL>}

iabbrev $<html>
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
