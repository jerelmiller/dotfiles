call plug#begin('~/.config/nvim/plugged')
"JavaScript
Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }

" GraphQL
Plug 'jparise/vim-graphql'

" Happiness
Plug 'tpope/vim-git'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sbdchd/neoformat'

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()
