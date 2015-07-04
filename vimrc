set nocompatible  " Required by Vundle
filetype off      " Required by Vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'kchmck/vim-coffee-script'

" Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required

colorscheme monokai
syntax on                   " enable syntax highlighting

let mapleader="\<Space>"

map <leader>vi :tabe ~/.vimrc<cr>

nmap 0 ^

" Custom commands
command! Q q " Bind Q to q

" Custom config
set backspace=indent,eol,start
set autoindent
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set scrolloff=4
