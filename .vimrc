" --------------------- Basic ---------------------
filetype on
filetype plugin on
filetype indent on
syntax enable
set hidden
set nocompatible
set wildmenu
set wildignore+=**/node_modules/**
set number
set relativenumber
set hls
set softtabstop=4 shiftwidth=4
set ts=4 sw=4
set expandtab
set backspace=indent,eol,start
set timeoutlen=500 " Only wait 500 milliseconds after ESC is pressed
set laststatus=2

" --------------------- Plugins ---------------------
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " Syntax checking
    Plug 'dense-analysis/ale'

    " Color schemes
    Plug 'morhetz/gruvbox'
call plug#end()

" Setup ALE
"
" make sure a rust-analyzer binary is setup in somewhere in your $PATH... :help ale-integration-rust 
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'rust': ['cargo', 'analyzer']
\}

" --------------------- Color Settings ---------------------
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

" --------------------- Mappings ---------------------
nnoremap <silent> <c-p> :FZF<CR>
nnoremap <silent> <c-F> :Rg<CR>
