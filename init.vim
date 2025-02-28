" Set leader key to space
let mapleader=" "

" General settings
set number              " Show line numbers
set relativenumber      " Relative line numbers
set tabstop=4          " Number of spaces for a tab
set shiftwidth=4       " Number of spaces for indentation
set expandtab          " Use spaces instead of tabs
set autoindent         " Auto-indent new lines
set smartindent        " Smart indentation
set ignorecase         " Case insensitive searching
set smartcase          " Case-sensitive if uppercase letters are used
set cursorline         " Highlight current line
set wrap               " Enable line wrapping
set undofile           " Persistent undo
set termguicolors      " Enable true color support

" Enable system clipboard
set clipboard+=unnamedplus

" Keybindings
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>a :qa<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>s :wq<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :NERDTree<CR>

" Plugins (assuming you're using vim-plug)
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" File Explorer
Plug 'preservim/nerdtree'
nnoremap <leader>e :NERDTreeToggle<CR>

" Status line
Plug 'vim-airline/vim-airline'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>f :Files<CR>

call plug#end()

" Set theme
colorscheme gruvbox
