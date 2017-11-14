call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'raimondi/delimitmate'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'ajh17/vimcompletesme'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
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

"Easy Motion
map <Leader> <Plug>(easymotion-prefix)

"Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'

"General
set nocompatible		" act more like vim, less like vi
set backspace=2         " allowed to backspace at all times
set ignorecase			" searching is no longer case sensitive
set textwidth=80        " text width is now 80 characters
set ai			        " smart indent
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
set tabstop=2			" change tab to look like four spaces
set shiftwidth=2		" more about indenting
set softtabstop=2		" more about indenting
set expandtab			" changes tabs to spaces
set smarttab

set cindent
set cc=80

"Let's be more clear!
set title				" change the title of the terminal to file name
set history=1000		" more history!
set undolevels=1000	    " more undo levels!
set number				" label the numbers of each line
set numberwidth=4		" cap line cout at 99999

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
