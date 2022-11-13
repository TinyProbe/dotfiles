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
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Cursor
set gcr= "a:hor25-blinkwait300

" Font
set gfn= "SF\ Mono:h10

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
"hi Visual guifg=none guibg=#4070B0
"hi LineNr guifg=#99DD99
"hi CursorLineNr guifg=#BBFFBB guibg=#343A44
"hi CursorLine guibg=#343A44
"hi Comment guifg=#559955
"hi MatchParen guifg=#B080FF guibg=#AA4080

" Shortcuts
"nnoremap    <Leader>rt :%retab<CR>
"nnoremap    <Leader>ff <cmd>Telescope find_files<CR>
"nnoremap    <Leader>fg <cmd>Telescope live_grep<CR>
"nnoremap    <Leader>fb <cmd>Telescope buffers<CR>
"nnoremap    <Leader>fh <cmd>Telescope help_tags<CR>
"nmap        <Leader>pf <Plug>(Prettier)
nnoremap    <F5> :NERDTreeToggle<CR>
nnoremap    <Leader>d :bd<CR>
nnoremap    <Leader>n :bn<CR>
nnoremap    <Leader>p :bp<CR>
nnoremap    <Leader>pi :PlugInstall<CR>
nnoremap    <Leader>pc :PlugClean<CR>
nnoremap    <Leader>pu :PlugUpdate<CR>
nnoremap    <Leader>sc :source ~/.config/nvim/init.vim<CR>
nnoremap    - <C-x>
nnoremap    = <C-a>
nnoremap    <C-a> GVgg
nnoremap    <C-b>b :buffers<CR>
nnoremap    <C-b>d :bdelete<CR>
nnoremap    <C-b>h :bprevious<CR>
nnoremap    <C-b>l :bnext<CR>
nnoremap    <C-b>j :blast<CR>
nnoremap    <C-b>k :bfirst<CR>
nnoremap    <C-t>b :tabs<CR>
nnoremap    <C-t>c :tabclose<CR>
nnoremap    <C-t>h :tabprevious<CR>
nnoremap    <C-t>l :tabnext<CR>
nnoremap    <C-t>j :tablast<CR>
nnoremap    <C-t>k :tabfirst<CR>
nnoremap    <C-t>t :tabnew<CR>:terminal<CR>i
nnoremap    <C-w>t :new<CR>:terminal<CR>i
xnoremap    <Tab> >gv
xnoremap    <S-Tab> <gv
vnoremap    <C-j> :m'>+<CR>gv
vnoremap    <C-k> :m-2<CR>gv
vnoremap    ( s()<ESC>hp%
vnoremap    ) s(  )<ESC>hhpl%
vnoremap    { s{}<ESC>hp%
vnoremap    } s{  }<ESC>hhpl%
vnoremap    <A-[> s[]<ESC>hp%
vnoremap    <A-]> s[  ]<ESC>hhpl%
vnoremap    < s<><ESC>hp
vnoremap    > s<  ><ESC>hhp
vnoremap    ' s''<ESC>hp
vnoremap    " s""<ESC>hp
vnoremap    / :norm i//<CR>
vnoremap    ? :norm 2x<CR>
vnoremap    <A-/> s/*  */<ESC>hhhp
vnoremap    <A-?> :s/\/\* //<CR>gv:s/ \*\//<CR>
nnoremap    yy Vdugv<ESC>
vnoremap    y dugv<ESC>
vnoremap    p pgvy

" Vim Plug
call plug#begin()
" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'ryanoasis/vim-devicons'

" Theme
Plug 'morhetz/gruvbox'

" Utilities
"Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug '907th/vim-auto-save'

" Completion/Linters/Formatters
"Plug 'tpope/vim-surround'
"Plug 'preservim/nerdcommenter'

" Git
"Plug 'airblade/vim-gitgutter'
call plug#end()

" Appearance
let g:lightline = { 'colorscheme': 'gruvbox' }
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

" Theme
colorscheme gruvbox

" Utilities
let g:auto_save=1
let NERDTreeShowHidden=1

" Additional config
let g:rust_recommended_style=0

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
