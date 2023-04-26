"Activate indentation
filetype off
filetype plugin indent on
set smartindent
"Non-expanded, 4-wide tabulations
set noexpandtab
"Disable vi-compatibility
set nocompatible
"Real-world encoding
set encoding=utf-8
"Interpret modelines in files
set modelines=1
"Do not abandon buffers
set hidden
"Don't bother throttling tty
set ttyfast
"More useful backspace behavior
set backspace=indent,eol,start
"Use statusbar on all windows
set laststatus=2
"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"My config
set title
set number
set cursorline
set laststatus=2
set mouse=a
set clipboard=unnamed,unnamedplus
set hidden
set hlsearch
set incsearch
set nowrap
set nobackup
set noundofile
set noswapfile
set autoread
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set scrolloff=6
set sidescrolloff=9
set list
set listchars=tab:→·
set colorcolumn=81
set termguicolors

autocmd BufEnter *.cpp :setlocal cindent cino=j1,(0,ws,Ws

highlight Cursorline guibg='#555555'
highlight CursorLineNr guifg='#ffff88' guibg='#555555'
highlight Visual guibg='#008888'
highlight NonText guifg='#555555' guibg=None
highlight MatchParen guifg='#ff0000' guibg='#000000'
highlight Comment guifg='#008844'

nnoremap <Space>co <Cmd>edit ~/.config/nvim/init.vim<CR>
nnoremap <Space>cr <Cmd>source ~/.config/nvim/init.vim<CR>
nnoremap <Space>bs <Cmd>buffers<CR>
nnoremap <Space>bd <Cmd>bdelete<CR>
nnoremap <Space>bl <Cmd>bnext<CR>
nnoremap <Space>bh <Cmd>bprevious<CR>
nnoremap <Space>bj <Cmd>blast<CR>
nnoremap <Space>bk <Cmd>bfirst<CR>
nnoremap <Space>ts <Cmd>tabs<CR>
nnoremap <Space>tc <Cmd>tabclose<CR>
nnoremap <Space>tl <Cmd>tabnext<CR>
nnoremap <Space>th <Cmd>tabprevious<CR>
nnoremap <Space>tj <Cmd>tablast<CR>
nnoremap <Space>tk <Cmd>tabfirst<CR>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv
vnoremap H <gv
vnoremap L >gv

nnoremap h <BackSpace>
nnoremap l <Space>
vnoremap h <BackSpace>
vnoremap l <Space>

nnoremap <C-q>q :xa<CR>
nnoremap <C-q>c :qa!<CR>
nnoremap <C-q>b :bdelete<CR>
nnoremap <C-q>w <C-w>c
nnoremap <C-q>t :tabclose<CR>

nnoremap gg gg0
nnoremap ge G0
nnoremap gu H0
nnoremap gm M0
nnoremap gd L0
nnoremap gs ^
nnoremap gh 0
nnoremap gl $
nnoremap gn :bnext<CR>zz
nnoremap gp :bprevious<CR>zz
vnoremap gg gg0
vnoremap ge G0
vnoremap gu H0
vnoremap gm M0
vnoremap gd L0
vnoremap gs ^
vnoremap gh 0
vnoremap gl $
vnoremap gn :bnext<CR>zz
vnoremap gp :bprevious<CR>zz

nmap <C-h> 3h
nmap <C-l> 3l
nmap <C-j> 3<C-e>
nmap <C-k> 3<C-y>
vmap <C-h> 3h
vmap <C-l> 3l
vmap <C-j> 3<C-e>
vmap <C-k> 3<C-y>

nnoremap piw lbveP
nnoremap pp p
nnoremap PP P
nnoremap - <C-x>
nnoremap = <C-a>
nnoremap <C-a> GVgg
nnoremap <C-s> :wa<CR>
vnoremap J :m'>+<CR>gv
vnoremap K :m-2<CR>gv
vnoremap ms( s()<ESC>hpl%
vnoremap ms) s(  )<ESC>hhpll%
vnoremap ms{ s{}<ESC>hpl%
vnoremap ms} s{  }<ESC>hhpll%
vnoremap ms[ s[]<ESC>hpl%
vnoremap ms] s[  ]<ESC>hhpll%
vnoremap ms< s<><ESC>hp
vnoremap ms> s<  ><ESC>hhp
vnoremap ms' s''<ESC>hp
vnoremap ms" s""<ESC>hp
vnoremap / :norm i// <CR>
vnoremap ? :norm 3x<CR>
vnoremap p P
vnoremap P p
vnoremap u <ESC>u
vnoremap U <ESC>u
