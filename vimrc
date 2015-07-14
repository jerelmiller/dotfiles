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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

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
nmap <leader>c :TComment<cr>
nmap <leader>ch :noh<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>p viwp<ESC>b
" nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<cr>
nmap 0 ^

" Custom commands
command! Q q
command! W w
command! Wq wq

" CtrlP customization
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 50000

" Custom config
set backspace=indent,eol,start
set autoindent
set history=500
set ruler
set showcmd
set incsearch
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set relativenumber
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
set clipboard=unnamed
set splitright
set splitbelow

set wildignore+=*/tmp*/,*.swp,*.zip,*.scssc
set wildignore+=*/generated/*,*/images/*,*/node_modules/*

runtime macros/matchit.vim        " use % to jump between start/end of methods

" Use haml syntax highlighting for jst.hamlc files
autocmd BufNewFile,BufReadPost *.hamlc set filetype=haml

" Override colorscheme to show backgrounds on search terms instead of
" underlines
highlight Search ctermfg=black ctermbg=yellow cterm=NONE guifg=black guibg=yellow gui=NONE
