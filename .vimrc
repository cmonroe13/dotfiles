call plug#begin()
Plug 'bazelbuild/vim-ft-bzl'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'racer-rust/vim-racer'
Plug 'raimondi/delimitmate'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
call plug#end()

nmap <C-o> :NERDTreeToggle<CR>

nmap <C-i> :Vista!!<CR>
let g:vista_sidebar_width = 64
let g:vista_executive_for = {
\  'cpp': 'ale',
\}

let g:ale_cpp_ccls_init_options = {
\  'cache': {
\    'directory': '.ccls-cache'
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

nnoremap <C-p> :Files<cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({}), <bang>0)

let g:lightline = {
\  'component_function': {
\  },
\  'colorscheme': 'base16_embers',
\}

let g:tmuxline_powerline_separators = 0

let base16colorspace=256
colorscheme base16-embers

set backspace=indent,eol,start

set autoindent
set smartindent

set autoread

set ruler

set noswapfile

set cursorline

set ignorecase
set incsearch
set hlsearch

set wildmenu

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab

set cindent
set cc=80

set title
set history=8192
set undolevels=8192

set number relativenumber
set nu rnu

set laststatus=2

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

set splitbelow
set splitright

nmap <C-,> <C-i>
nmap <C-.> <C-o>
