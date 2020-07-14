let mapleader=','

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
end

filetype plugin indent on
syntax enable

set background=dark
let g:enable_italic_font=1
let g:hybrid_reduced_contrast=1
let g:hybrid_custom_term_colors=1
colorscheme hybrid_material

highlight clear SignColumn

set autoindent
set autoread
set clipboard=unnamed
set colorcolumn=80
set cursorline
set cmdheight=2
set expandtab
set guicursor=
set hidden
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set nobackup
set noswapfile
set number
set nowrap
set nowritebackup
set relativenumber
set ruler
set scrolloff=4
" https://github.com/neoclide/coc.nvim#example-vim-configuration
set shortmess+=c
set sidescrolloff=5
set signcolumn=yes
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
set updatetime=100
