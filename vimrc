" Plugins
call plug#begin('~/.vim/plugged')

" Add your plugins here
Plug 'preservim/nerdtree'        " File explorer
Plug 'dense-analysis/ale'        " Asynchronous linting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:ale_linters = {
  \   'c': ['clang', 'gcc'],
  \   'python': ['flake8'],
  \}

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1

" display line numbers on the sidebar
set number

" Display current line and column on the bottom bar
set ruler

" Set tabs to be 2 spaces wide
set tabstop=2
set shiftwidth=2

" Automatically indent code when going to the next line
set autoindent

" Expand tab characters to be spaces.
set expandtab

" highligh search results
set hlsearch

" start search without having to submit
set incsearch

" allow mouse for pasting etc
set mouse=a

"Keep 7 lines visible at the top and bottom of the screen when scrolling
set so=7

" Do not let cursor scroll below or above N number of lines when scrolling.
 set scrolloff=10

" use n and N to center the next search result on the screen
nmap n nzz
nmap N Nzz

" show whitespace
set list
set listchars=tab:>.,trail:.

" Flash on the screen instead of making the bell sound
set noerrorbells

" Do not let cursor scroll below or above N number of lines when scrolling.
 set scrolloff=10

filetype on
syntax on

set termguicolors
colorscheme dracula

set relativenumber

set t_Co=256

set cursorline

nnoremap ,f :Files<CR>
nnoremap ,b :Buffers<CR>
nnoremap ,s :nohlsearch<CR>
nnoremap ,t :NERDTree<CR>
