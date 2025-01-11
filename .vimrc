filetype off                          " Activate indentation
filetype plugin indent on
set background=dark                   " Useful settings
set clipboard=unnamed,unnamedplus
set nocompatible                      " Disable vi-compatibility
set encoding=utf-8                    " Real-world encoding
set virtualedit=all                   " Cursor can move every space 
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
set splitbelow splitright
set wildmenu
set autoread
set smartindent
set autoindent
set smarttab
set expandtab
" set guifont=
" set guicursor=
set title
set number
set numberwidth=2
set norelativenumber
set colorcolumn=80
set cursorline
set cursorcolumn
set mouse=a
set updatetime=0
set notimeout
" set noshowmode
set nowrap
set nobackup
set noswapfile
set undofile
set undodir=~/.cache/vim/undo
set undolevels=4096
" set spell
" set spelllang=en
set softtabstop=4
set tabstop=4
set shiftwidth=4
set scrolloff=6
set sidescrolloff=9
set termguicolors
set list
set listchars=tab:→·
set fillchars=eob:\ 
set foldcolumn=1
set foldmethod=marker
" set foldexpr=GetFold(v:lnum)

syntax on
colorscheme torte
hi CursorLine term=none cterm=none
hi CursorLineNr term=none cterm=none guifg=Green guibg=Grey40

augroup PreventBackupPrivate
    autocmd!
    autocmd BufWrite /private/tmp/crontab.* set nowritebackup
    autocmd BufWrite /private/etc/pw.* set nowritebackup
augroup end

augroup vimrcEx
    autocmd!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
augroup end

augroup BufDefault
    autocmd!
    autocmd BufNewFile * :write
    autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc,*.java,*.js,*.cs
                \ :setlocal cindent
                \|:setlocal cinkeys+=0{,0},0),0],:,0#,!^F,o,O,e
                \|:setlocal cinoptions=Ls,:0,=s,l1,b0,g0,hs,N-s,E-s,i2s,+2s,(0,U1,w1,W2s,k2s,m1,M0,j1,J1
    " set comment keyword
    autocmd BufEnter *.asm
                \ let b:comment=";"
    autocmd BufEnter *.lua,*.mysql,*.sql
                \ let b:comment='--'
    autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc,*.cs,*.rs,*.java,*.js,*.php,*.go,*.kt,*.kts
                \ let b:comment="//"
    autocmd BufEnter *.sh,*.py,*.pl,*.rb,*.r,Makefile,Dockerfile
                \ let b:comment="#"
    autocmd BufEnter *.vb
                \ let b:comment="'"
    autocmd BufEnter *.vim
                \ let b:comment='"'
augroup end

function! CommentToggle()
    let l:frontline = trim(getline(line('.')))[0:strlen(b:comment)-1]
    if l:frontline == b:comment
        execute "normal! _".(strlen(b:comment)+1)."x"
    elseif strlen(l:frontline) != 0
        execute "normal! I".b:comment." \<ESC>"
    endif
endfunction

" mapping key with display description(if format is correctly)
" a:desc[ "_:..." | "...:_" ]: _[n|v|i]: what a mode when just before echo
" left: do echo before action, right: do echo after action
function! Mapping(mode, opt, key, act, desc)
    function! EchoInterpolation(desc, mode)
        let l:command = ":echo '".a:desc."'<CR>"
        if a:mode == "v"
            let l:command = "<ESC>".l:command."gv"
        elseif a:mode == "i"
            let l:command = "<ESC>`^".l:command."i"
        endif
        return l:command
    endfunction
    let l:command = ""
    if a:desc[1:1] == ":" && stridx("nvi", a:desc[0:0]) != -1
        let l:command = EchoInterpolation(a:desc[2:], a:desc[0:0]).a:act
    elseif a:desc[-2:-2] == ":" && stridx("nvi", a:desc[-1:-1]) != -1
        let l:command = a:act.EchoInterpolation(a:desc[:-3], a:desc[-1:-1])
    else
        let l:command = a:act
    endif
    execute a:mode."map ".a:opt." ".a:key." ".l:command
endfunction

mapclear
let g:unit=5
let mapleader=" "
let maplocalleader='\'

call Mapping("nore", "", "<C-q>", "<nop>", 'prevent key')
call Mapping("nore", "", "<up>", "<nop>", 'prevent key')
call Mapping("nore", "", "<down>", "<nop>", 'prevent key')
call Mapping("nore", "", "<left>", "<nop>", 'prevent key')
call Mapping("nore", "", "<right>", "<nop>", 'prevent key')
call Mapping("nore", "", "gg", "<nop>", 'prevent key')
call Mapping("nore", "", "G", "<nop>", 'prevent key')
call Mapping("nnore", "", "p", "<nop>", 'prevent key')
call Mapping("nnore", "", "P", "<nop>", 'prevent key')

call Mapping("nnore", "<silent>", "<leader>co", ":edit ~/.config/nvim/init.vim<cr>", 'open config:n')
call Mapping("nnore", "<silent>", "<leader>cr", ":source ~/.config/nvim/init.vim<cr>", 'reload config:n')
call Mapping("nnore", "<silent>", "<leader>fe", ":edit .<cr>", 'file explorer:n')
call Mapping("nnore", "<silent>", "<leader>bs", ":buffers<cr>", 'buffer list:n')
call Mapping("nnore", "<silent>", "<leader>bd", ":bdelete<cr>", 'delete buffer:n')
call Mapping("nnore", "<silent>", "<leader>bn", ":bnext<cr>", 'next buffer:n')
call Mapping("nnore", "<silent>", "<leader>bp", ":bprevious<cr>", 'previous buffer:n')
call Mapping("nnore", "<silent>", "<leader>bh", ":bfirst<cr>", 'first buffer:n')
call Mapping("nnore", "<silent>", "<leader>bl", ":blast<cr>", 'last buffer:n')
call Mapping("nnore", "<silent>", "<leader>ts", ":tabs<cr>", 'tab list:n')
call Mapping("nnore", "<silent>", "<leader>tc", ":tabclose<cr>", 'close tab:n')
call Mapping("nnore", "<silent>", "<leader>tn", ":tabnext<cr>", 'next tab:n')
call Mapping("nnore", "<silent>", "<leader>tp", ":tabprevious<cr>", 'previous tab:n')
call Mapping("nnore", "<silent>", "<leader>th", ":tabfirst<cr>", 'first tab:n')
call Mapping("nnore", "<silent>", "<leader>tl", ":tablast<cr>", 'last tab:n')

call Mapping("nnore", "", "<", "<<", 'outdent:n')
call Mapping("nnore", "", ">", ">>", 'indent:n')
call Mapping("vnore", "", "<", "<gv", 'outdent-line')
call Mapping("vnore", "", ">", ">gv", 'indent-line')
call Mapping("vnore", "", "H", "<gv", 'outdent-line')
call Mapping("vnore", "", "L", ">gv", 'indent-line')

call Mapping("nnore", "", "h", "<bs>", 'move left')
call Mapping("nnore", "", "l", "<space>", 'move right')
call Mapping("vnore", "", "h", "<bs>", 'move left')
call Mapping("vnore", "", "l", "<space>", 'move right')

call Mapping("nnore", "<silent>", "<space>qq", ":xa<cr>", 'quit with save')
call Mapping("nnore", "<silent>", "<space>qc", ":qa!<cr>", 'quit without save')
call Mapping("nnore", "<silent>", "<space>qb", ":bdelete<cr>", 'delete buffer:n')
call Mapping("nnore", "", "<space>qw", "<C-w>c", 'close window:n')
call Mapping("nnore", "<silent>", "<space>qt", ":tabclose<cr>", 'close tab:n')

call Mapping("nnore", "", "gk", "gg0", 'goto first line:n')
call Mapping("nnore", "", "gj", "G0zz", 'goto last line:n')
call Mapping("nnore", "", "gt", "H0", 'goto top screen:n')
call Mapping("nnore", "", "gc", "M0", 'goto center screen:n')
call Mapping("nnore", "", "gb", "L0", 'goto bottom screen:n')
call Mapping("nnore", "", "gs", "_", 'goto first character:n')
call Mapping("nnore", "", "ge", "g_", 'goto last character:n')
call Mapping("nnore", "", "gh", "0", 'goto first column:n')
call Mapping("nnore", "", "gl", "$", 'goto last column:n')
call Mapping("nnore", "", "gm", "gM", 'goto middle character:n')
call Mapping("nnore", "", "gM", "gm", 'goto ???:n')
call Mapping("nnore", "<silent>", "gn", ":bnext<cr>zz", 'goto next buffer:n')
call Mapping("nnore", "<silent>", "gp", ":bprevious<cr>zz", 'goto previous buffer:n')
call Mapping("vnore", "", "gk", "gg0", 'goto first line:v')
call Mapping("vnore", "", "gj", "G0zz", 'goto last line:v')
call Mapping("vnore", "", "gt", "H0", 'goto top screen:v')
call Mapping("vnore", "", "gc", "M0", 'goto center screen:v')
call Mapping("vnore", "", "gb", "L0", 'goto bottom screen:v')
call Mapping("vnore", "", "gs", "_", 'goto first character:v')
call Mapping("vnore", "", "ge", "g_", 'goto last character:v')
call Mapping("vnore", "", "gh", "0", 'goto first column:v')
call Mapping("vnore", "", "gl", "$", 'goto last column:v')
call Mapping("vnore", "", "gm", "gM", 'goto middle character:v')
call Mapping("vnore", "", "gM", "gm", 'goto ???:v')
call Mapping("vnore", "<silent>", "gn", "<esc>:bnext<cr>zz", 'goto next buffer:n')
call Mapping("vnore", "<silent>", "gp", "<esc>:bprevious<cr>zz", 'goto previous buffer:n')

call Mapping("n",     "", "<C-h>", (g:unit*2)."zh", 'unit scroll left:n')
call Mapping("n",     "", "<C-l>", (g:unit*2)."zl", 'unit scroll right:n')
call Mapping("nnore", "", "<C-j>", (g:unit)."<C-e>", 'unit scroll down:n')
call Mapping("nnore", "", "<C-k>", (g:unit)."<C-y>", 'unit scroll up:n')
call Mapping("v",     "", "<C-h>", (g:unit*2)."zh", 'unit scroll left:n')
call Mapping("v",     "", "<C-l>", (g:unit*2)."zl", 'unit scroll right:n')
call Mapping("vnore", "", "<C-j>", (g:unit)."<C-e>", 'unit scroll down:n')
call Mapping("vnore", "", "<C-k>", (g:unit)."<C-y>", 'unit scroll up:n')

call Mapping("n", "", "piw", "viwp", 'paste inner word(ignored):n')
call Mapping("n", "", "Piw", "viwP", 'paste inner word(yanked):n')
call Mapping("nnore", "", "pp", "p", 'paste back:n')
call Mapping("nnore", "", "PP", "P", 'paste front:n')
call Mapping("vnore", "", "p", "P", 'replace to select(ignored):n')
call Mapping("vnore", "", "P", "p", 'replace to select(yanked):n')
call Mapping("vnore", "", "u", "<esc>u", 'undo:n')
call Mapping("vnore", "", "U", "<esc>u", 'undo:n')

call Mapping("nnore", "", "-", "<C-x>", 'decrease value:n')
call Mapping("nnore", "", "=", "<C-a>", 'increase value:n')
call Mapping("nnore", "", "<C-a>", "GVgg", 'n:select all')
call Mapping("nnore", "<silent>", "<C-s>", ":wa<cr>", 'save all buffer:n')
call Mapping("nnore", "", "<leader>y", "mqGVggy`qzz", 'yank all:n')
call Mapping("nnore", "", "<leader>=", "mqGVgg=`qzz", 'reindention:n')
call Mapping("nnore", "", "<leader>-", '/\<\><cr>', 'clear register')
call Mapping("vnore", "<silent>", "J", ":m'>+<cr>gv", 'selected line down')
call Mapping("vnore", "<silent>", "K", ":m-2<cr>gv", 'selected line up')
call Mapping("nnore", "<silent>", "<leader>/", "mq:call CommentToggle()<cr>`q", 'toggle comment:n')
call Mapping("vnore", "<silent>", "<leader>/", "mq:call CommentToggle()<cr>`q", 'toggle comment:n')

call Mapping("onore", "<silent>", "i<space>", ":<C-u>normal lBvhE<cr>", 'inner from space')
call Mapping("vnore", "<silent>", "i<space>", ":<C-u>normal lBvhE<cr>", 'inner from space')
call Mapping("onore", "<silent>", "ic", ":<C-u>normal _vg_<cr>", 'inner characters')
call Mapping("vnore", "<silent>", "ic", ":<C-u>normal _vg_<cr>", 'inner characters')
call Mapping("onore", "<silent>", "il", ":<C-u>normal 0v$<cr>", 'inner line')
call Mapping("vnore", "<silent>", "il", ":<C-u>normal 0v$<cr>", 'inner line')

call Mapping("vnore", "", "ms(", "s()<esc>hpl%", 'match surround():n')
call Mapping("v",     "", "ms)", "ms(", 'match surround():n')
call Mapping("vnore", "", "ms{", "s{}<esc>hpl%", 'match surround{}:n')
call Mapping("v",     "", "ms}", "ms{", 'match surround{}:n')
call Mapping("vnore", "", "ms[", "s[]<esc>hpl%", 'match surround[]:n')
call Mapping("v",     "", "ms]", "ms[", 'match surround[]:n')
call Mapping("vnore", "", "ms<", "s<><esc>hp", 'match surround<>:n')
call Mapping("v",     "", "ms>", "ms<", 'match surround<>:n')
call Mapping("vnore", "", "ms'", "s''<esc>hp", "match surround'':n")
call Mapping("vnore", "", 'ms"', 's""<esc>hp', 'match surround"":n')
call Mapping("vnore", "", "ms<space>", "s  <esc>hp", "match surround  :n")

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
call Mapping("n", "", "mr<Space>", "di<Space>vhpgvms", "match replace   => ??")

abclear
iabbrev $<cpp_random>
            \ template <class T>
            \<NL>T _rand(T mn, T mx) {
                \<NL>static std::mt19937 gen((std::random_device())());
                \<NL>return (std::uniform_int_distribution<T>(mn, mx))(gen);
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
