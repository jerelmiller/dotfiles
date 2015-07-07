set nocompatible  " Required by Vundle
filetype off      " Required by Vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'

" Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required

colorscheme monokai
syntax on                   " enable syntax highlighting

let mapleader=","

nmap <leader>vi :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>pi :PluginInstall<cr>
nmap <leader>t :CtrlP<cr>
nmap <leader>nt :NERDTreeToggle<cr>

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
set nowrap
set scrolloff=4
set sidescrolloff=5
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set cursorline
set shiftround
set wildmenu
set wildmode=list:longest
set backupdir=~/.tmp
set directory=~/.tmp
set colorcolumn=80

runtime macros/matchit.vim        " use % to jump between start/end of methods
