call plug#begin('~/.config/nvim/plugged')
"JavaScript
Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }

" GraphQL
Plug 'jparise/vim-graphql'

" Happiness
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
Plug 'wakatime/vim-wakatime'

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()
