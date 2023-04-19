" Option
set background=dark
set clipboard=unnamed,unnamedplus
set hidden
set hlsearch
set incsearch
set inccommand=split
set mouse=a
set number
set cursorline
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set nowrap
set noshowmode
set noswapfile
set autoread
set autoindent
set smartindent
set smarttab
"set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set title
set number
set cursorline
set mouse=a
set clipboard=unnamed,unnamedplus
set hidden
set hlsearch
set incsearch
set nobackup
set noswapfile
set softtabstop=4
set tabstop=4
set shiftwidth=4
set scrolloff=8
set sidescrolloff=12
set list
set listchars=tab:→·

nnoremap \co <Cmd>edit /Users/tiny/.vimrc<CR>
nnoremap \cr <Cmd>source /Users/tiny/.vimrc<CR>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv
nnoremap H <gv
nnoremap L >gv

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

nnoremap <C-h> 3h
nnoremap <C-l> 3l
nnoremap <C-j> 3<C-e>
nnoremap <C-k> 3<C-y>
vnoremap <C-h> 3h
vnoremap <C-l> 3l
vnoremap <C-j> 3<C-e>
vnoremap <C-k> 3<C-y>

nnoremap piw lbveP
nnoremap pp p
nnoremap PP P
nnoremap - <C-x>
nnoremap = <C-a>
nnoremap <C-a> GVgg
nnoremap <C-s> :wa<CR>
nnoremap <C-b>s :buffers<CR>
nnoremap <C-b>d :bdelete<CR>
nnoremap <C-b>l :bnext<CR>
nnoremap <C-b>h :bprevious<CR>
nnoremap <C-b>j :blast<CR>
nnoremap <C-b>k :bfirst<CR>
nnoremap <C-t>s :tabs<CR>
nnoremap <C-t>c :tabclose<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>j :tablast<CR>
nnoremap <C-t>k :tabfirst<CR>
nnoremap <C-t>t :tabnew<CR>:terminal<CR>i
nnoremap <C-w>t :new<CR>:terminal<CR>i
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
vnoremap ms\ s\"\"<ESC>hp
vnoremap / :norm i// <CR>
vnoremap ? :norm 3x<CR>
vnoremap p P
vnoremap P p
vnoremap u <ESC>u
vnoremap U <ESC>u
