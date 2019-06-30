call plug#begin()
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'racer-rust/vim-racer'
Plug 'raimondi/delimitmate'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()

"Enable Plugins
filetype plugin on

"Disable scratch preview
set completeopt-=preview

"Leader
let mapleader=" "

"Nerd Tree
map <C-o> :NERDTreeToggle<CR>

map <Tab> :TagbarToggle<CR>

"Theme
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-eighties
let g:airline_theme='base16_eighties'

"Easy Motion
map <Leader> <Plug>(easymotion-prefix)

"Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'

let g:ale_linters = {'cpp': ['clangtidy']}

"General
set nocompatible
set backspace=2
set ignorecase
set textwidth=80
set ai
set si
set autoread
set ruler
set hlsearch
set noswapfile
set cursorline

"Search
set incsearch
set hlsearch

"Menu
set wildmenu

"Tabbing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set cindent
set cc=80

"Let's be more clear!
set title
set history=1000
set undolevels=1000
set number
set numberwidth=4

"Change window splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

set splitbelow
set splitright

"Jump remap
map <C-,> <C-i>
map <C-.> <C-o>

"FZF fuzzy file search
nnoremap <C-p> :FZF<cr>

tnoremap <ESC><ESC> <C-\><C-N>
