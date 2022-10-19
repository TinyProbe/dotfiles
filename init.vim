" Options
set background=dark
set clipboard=unnamed,unnamedplus
set completeopt=noinsert,menuone,noselect
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
set smarttab
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Cursor
set gcr=a:block,a:blinkon0

" Font
"set gfn=SauceCodePro\ NF:h14

" RGB
syntax on
set t_Co=256

augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
augroup END

if exists('+termguicolors') 
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Color Modify
"hi Normal ctermbg=none guifg=#D0D0D0 guibg=#181C24
hi Visual guifg=none guibg=#4070B0
hi LineNr guifg=#99DD99
hi CursorLineNr guifg=#BBFFBB guibg=#343A44
hi CursorLine guibg=#343A44
hi Comment guifg=#559955
hi MatchParen guifg=#A070FF guibg=AA4080

" Shortcuts
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT
"nnoremap <F5> :NERDTreeToggle<CR>
"nnoremap <silent><S-t> :tabnew<CR>
"nnoremap <Leader>rt :%retab<CR>
"nnoremap <Leader>ff <cmd>Telescope find_files<CR>
"nnoremap <Leader>fg <cmd>Telescope live_grep<CR>
"nnoremap <Leader>fb <cmd>Telescope buffers<CR>
"nnoremap <Leader>fh <cmd>Telescope help_tags<CR>
"nmap <Leader>pf <Plug>(Prettier)
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>sc :source ~/.config/nvim/init.vim<CR>
nnoremap <Tab> :n<CR>
nnoremap <S-Tab> :N<CR>
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
nnoremap - <C-x>
nnoremap = <C-a>
nnoremap <C-x> <S-~>h
nnoremap <A-x> <S-~>
nnoremap <C-a> ggVG
nnoremap <C-q> :q!<CR>
nnoremap <C-s> :w<CR>
nmap <C-h> b
nmap <C-l> w
nmap <A-h> ^
nmap <A-l> $
nmap <C-j> <C-e>
nmap <C-k> <C-y>
nmap <A-j> <C-d>
nmap <A-k> <C-u>
nmap <Leader>d :bd<CR>
nmap <Leader>n :bn<CR>
nmap <Leader>p :bp<CR>
vnoremap ( s()<esc>hp
vnoremap ) s(  )<esc>hhp
vnoremap { s{}<esc>hp
vnoremap } s{  }<esc>hhp
vnoremap <A-[> s[]<esc>hp
vnoremap <A-]> s[  ]<esc>hhp
vnoremap < s<><esc>hp
vnoremap > s<  ><esc>hhp
vnoremap ' s''<esc>hp
vnoremap " s""<esc>hp
vnoremap / :norm i//<CR>
vnoremap ? :norm 2x<CR>
vnoremap <A-/> s/*  */<esc>hhhp
vnoremap <A-?> :s/\/\* //<CR>gv:s/ \*\//<CR>
nnoremap yy Vdu
vnoremap y du
vnoremap p pgvy

" Vim Plug
call plug#begin()
" Appearance
Plug 'vim-airline/vim-airline'
"Plug 'ryanoasis/vim-devicons'

" Theme
"Plug 'joshdick/onedark.vim'

" Utilities
"Plug 'preservim/nerdtree'
"Plug 'sheerun/vim-polyglot'
Plug '907th/vim-auto-save'

" Completion/Linters/Formatters
"Plug 'tpope/vim-surround'
"Plug 'preservim/nerdcommenter'

" Git
"Plug 'airblade/vim-gitgutter'
call plug#end()

" Appearance
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Theme
"let g:onedark_termcolors=16
"let g:onedark_hide_endofbuffer=1

" Utilities
let g:auto_save=1
"let NERDTreeShowHidden=1

" NERD Commenter
" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims=1
" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs=1
" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign='left'
" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java=1
" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines=1
" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace=1
" customize keymapping
"map <Leader>cc <plug>NERDComToggleComment
"map <Leader>c<space> <plug>NERDComComment
