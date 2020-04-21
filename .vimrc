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
    Plug '/usr/local/opt/fzf' " Fuzzy finder
    Plug 'junegunn/goyo.vim'

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " Color schemes
    Plug 'morhetz/gruvbox'
call plug#end()

" --------------------- Color Settings ---------------------
colorscheme gruvbox
let g:airline_theme='gruvbox'
