if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

let mapleader=','

" Syntax highlighting
syntax enable
set background=dark
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
colorscheme hybrid_material

set autoindent
set autoread
set clipboard=unnamed
set colorcolumn=80
set cursorline
set expandtab
set hidden
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set nobackup
set noswapfile
set number
set nowrap
set relativenumber
set ruler
set scrolloff=4
set sidescrolloff=5
set shiftround
set shiftwidth=2
set showcmd
set smartcase
set smarttab
set splitright
set splitbelow
set softtabstop=2
set tabstop=2
set visualbell
set wildmenu
set wildmode=list:longest

nohlsearch " Kill Highlighting on vimrc reload

command! Q q
command! W w
command! Wq wq
command! Qa qa

" Use 0 to go to first character instead of beginning of line
nnoremap 0 ^

" Use ctrl-h/j/k/l to move between splits
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

inoremap jk <esc>
inoremap Jk <esc>

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>vi :sp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>ch :silent noh<cr>

" replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

let g:neoformat_try_formatprg = 1

augroup filetypes
  autocmd!

  autocmd BufNewFile,BufReadPost .eslintrc,.babelrc set filetype=json
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd filetype help call HelpFileMode()

  " Always open quickfix window on bottom
  autocmd FileType qf wincmd J
augroup END

function! HelpFileMode()
  nnoremap <buffer> <cr> <c-]>
  nnoremap <buffer> <bs> <c-T>
  nnoremap <buffer> q :q<cr>
endfunction

