" --------------------- Basic ---------------------
filetype on
filetype plugin on
filetype indent on
syntax enable

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set smartcase
set incsearch
set scrolloff=8
set nocompatible
set hidden " Keep buffers open without having to save them
set timeoutlen=500 " Only wait 500 milliseconds after ESC is pressed

" --------------------- Plugins ---------------------
call plug#begin('~/.vim/plugged')
    " Statusline
    Plug 'vim-airline/vim-airline'
    
    " Color schemes
    Plug 'morhetz/gruvbox'

    " Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " Syntax checking
    Plug 'dense-analysis/ale'
call plug#end()

" --------------------- Color Settings ---------------------
colorscheme gruvbox
set background=dark

" --------------------- Mappings ---------------------
let mapleader = " "
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>f :BLines<CR>
nnoremap <silent> <leader>F :Rg<CR>
nnoremap <silent> <leader>gt :ALEGoToDefinition<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" --------------------- Source ---------------------
source ~/.vim/scripts/bracketed-paste.vim

" --------------------- Syntax Checking ---------------------
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['cargo', 'analyzer']}

" --------------------- File Explorer ---------------------
let g:netrw_banner = 0
let g:netew_liststyle = 3
