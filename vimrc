set nocompatible  " Required by Vundle
filetype off      " Required by Vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'ervandew/supertab'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mtscout6/vim-cjsx'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'helino/vim-json'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/csv.vim'
Plugin 'moll/vim-node'

" Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required

syntax on                   " enable syntax highlighting
set background=dark
colorscheme monokai

let mapleader=","

nnoremap <leader>vi :sp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>pi :PluginInstall<cr>:q<cr>
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>c :TComment<cr>
nnoremap <leader>ch :noh<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>p viwp<ESC>b
nnoremap <leader>rs :AV<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>l :SyntasticCheck<cr>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

map <D-S-]> gt
map <D-S-[> gT

let @b="dir]pkk2dd"
nnoremap <leader>pir @b

let @i='/ifd$O"j>>oend:nohk0'
nnoremap <leader>if @i

" Use 0 to go to first character instead of beginning of line
nnoremap 0 ^

nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

" Execute grep for word under cursor and display in quickfix menu
" nnoremap <leader>g :grep! -R <cword> .<cr>:copen<cr>
nnoremap <leader>g :Ag! --ignore-dir=vendor --ignore-dir=db/old <cword><cr>
" nnoremap <leader>G :Ag! --ignore-dir=vendor --ignore-dir=db/old <cword><cr>
nnoremap <leader>ag :Ag!<Space>

inoremap jk <esc>

" Custom commands
command! Q q
command! W w
command! Wq wq

"delimitMate customization
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" CtrlP customization
let g:ctrlp_max_files = 0

" Better Whitespace customization
let g:strip_whitespace_on_save = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" syntastic customization
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_warning_symbol = '!'
let g:syntastic_error_symbol = '✗'

" airline customization
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'lucius'
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'

" rails.vim customization

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
set smarttab
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
set colorcolumn=80
set clipboard+=unnamed
set splitright
set splitbelow
set timeoutlen=400
set laststatus=2 " Always show status line
set t_ut=
set hidden
set visualbell
set nobackup
set noswapfile
set autoread
set lazyredraw
set suffixesadd+=.jsx.coffee,.coffee,.js.coffee

set wildignore+=*/tmp*/,*.swp,*.zip,*.scssc
set wildignore+=*/generated/*,*/images/*,*/node_modules/*,tmp/*

runtime macros/matchit.vim        " use % to jump between start/end of methods

augroup vimrcEx
  autocmd!

  " Use haml syntax highlighting for jst.hamlc files
  autocmd BufNewFile,BufReadPost *.hamlc set filetype=haml
  autocmd BufNewFile,BufReadPost .eslintrc set filetype=json

  " Bind 'q' to close the buffer for help files
  autocmd Filetype help nnoremap <buffer> q :q<CR>
augroup END

" Override colorscheme to show backgrounds on search terms instead of
" underlines
highlight Search ctermfg=black ctermbg=yellow cterm=NONE guifg=black guibg=yellow gui=NONE

" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff

" Allow for settings specific to machines this runs on
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
