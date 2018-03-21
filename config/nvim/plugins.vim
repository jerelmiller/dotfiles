call plug#begin('~/.config/nvim/plugged')
"JavaScript
Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" GraphQL
Plug 'jparise/vim-graphql'

" Text
Plug 'PeterRincker/vim-argumentative'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }

" Happiness
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Olical/vim-enmasse', { 'on': 'EnMasse' }
Plug 'rking/ag.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-git'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()
