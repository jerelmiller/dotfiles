call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-git'

"JavaScript
Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }

" GraphQL
Plug 'jparise/vim-graphql'

Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()
