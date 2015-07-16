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
Plugin 'vim-ruby/vim-ruby'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'christoomey/vim-tmux-navigator'

" Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required

colorscheme monokai
syntax on                   " enable syntax highlighting

let mapleader=","

nnoremap <leader>vi :sp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>pi :PluginInstall<cr>
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>c :TComment<cr>
nnoremap <leader>ch :noh<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>p viwp<ESC>b

" Use 0 to go to first character instead of beginning of line
nnoremap 0 ^

nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

" Custom commands
command! Q q
command! W w
command! Wq wq

" CtrlP customization
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden -g ""'

  " Use Silver Searcher instead of grep
  set grepprg=ag
endif

if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" Custom config
set backspace=indent,eol,start
set autoindent
set history=500
set ruler
set showcmd
set incsearch
set hlsearch
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set relativenumber
if v:version >= 704
  set number
endif
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
set timeoutlen=400
set laststatus=2 " Always show status line

set wildignore+=*/tmp*/,*.swp,*.zip,*.scssc
set wildignore+=*/generated/*,*/images/*,*/node_modules/*,tmp/*

runtime macros/matchit.vim        " use % to jump between start/end of methods

augroup vimrcEx
  autocmd!

  " Use haml syntax highlighting for jst.hamlc files
  autocmd BufNewFile,BufReadPost *.hamlc set filetype=haml

  " Bind 'q' to close the buffer for help files
  autocmd Filetype help nnoremap <buffer> q :q<CR>
augroup END

" remove trailing whitespace on save for ruby files
au BufWritePre *.rb :%s/\s\+$//e

" Override colorscheme to show backgrounds on search terms instead of
" underlines
highlight Search ctermfg=black ctermbg=yellow cterm=NONE guifg=black guibg=yellow gui=NONE
