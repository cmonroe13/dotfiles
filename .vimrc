call plug#begin()
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'racer-rust/vim-racer'
Plug 'raimondi/delimitmate'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'zah/nim.vim'
call plug#end()

"Enable Plugins
filetype plugin on

"Leader
let mapleader=" "

"Nerd Tree
map <C-o> :NERDTreeToggle<CR>

map <Tab> :Vista!!<CR>
let g:vista_sidebar_width = 60
let g:vista_executive_for = {
\  'cpp': 'ale',
\}

"Theme
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-eighties
let g:airline_theme='base16_eighties'

let g:ale_cpp_ccls_init_options = {
\  'cache': {
\    'directory': './.ccls-cache'
\  }
\}

let g:ale_completion_enabled = 0
let g:ale_linters = {
\  'cpp': ['ccls'],
\  'go': ['gofmt', 'gopls'],
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'cpp': ['clangtidy'],
\  'go': ['goimports'],
\}

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:vimspector_enable_mappings = 'HUMAN'

let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

"General
set nocompatible
set backspace=2
set ignorecase
set textwidth=80
set ai
set si
set autoread
set ruler
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
nnoremap <C-p> :Files<cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({}), <bang>0)

tnoremap <ESC><ESC> <C-\><C-N>
