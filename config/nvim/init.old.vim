call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
" Plug 'sheerun/vim-polyglot'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'github/copilot.vim'

Plug 'preservim/vimux'
Plug 'tyewang/vimux-jest-test'
" MDX
" Plug 'jxnblk/vim-mdx-js'

" Typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" JavaScript
" Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'js', 'jsx'] }
" Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'js', 'jsx'] }
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Plug 'jparise/vim-graphql'

" JSON
Plug 'kevinoid/vim-jsonc'

" Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
" Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Ruby
" Plug 'tpope/vim-rails'

" Text
Plug 'PeterRincker/vim-argumentative'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-datetime'
" Plug 'kana/vim-textobj-function'
Plug 'lucapette/vim-textobj-underscore'
Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'thinca/vim-textobj-function-javascript', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'vim-scripts/matchit.zip'

" Tests
Plug 'vim-test/vim-test'

" Happiness
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Olical/vim-enmasse', { 'on': 'EnMasse' }
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'SirVer/ultisnips'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

" Syntax colors
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'arcticicestudio/nord-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

let mapleader=','

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
end

filetype plugin indent on
syntax enable

" Nord settings which must be set before `colorscheme`
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight! CocUnusedHighlight cterm=underline ctermfg=4 gui=underline guifg=#4C5669
  autocmd ColorScheme nord highlight! CocMenuSel cterm=bold ctermbg=8 gui=bold guibg=#4C566A
  autocmd ColorScheme nord highlight! CocPumSearch ctermfg=6 guifg=#88C0D0
  autocmd ColorScheme nord highlight! CocFloating cterm=bold gui=bold guibg=#3B4252
augroup END

set background=dark
let g:enable_italic_font=1
" let g:hybrid_reduced_contrast=1
" let g:hybrid_custom_term_colors=1
colorscheme nord

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
set noshowmode

for config_file in split(glob('~/.config/nvim/settings/**/*'), '\n')
  if filereadable(config_file)
    execute 'source' config_file
  endif
endfor

" Treesitter setup
lua <<EOF
-- require'lspconfig'.elixirls.setup {
--  cmd = { os.getenv("HOME") .. "/.elixir-ls/release/language_server.sh" }
-- }

-- require'lspconfig'.tsserver.setup{}
EOF
