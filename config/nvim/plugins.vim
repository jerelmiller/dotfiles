call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sheerun/vim-polyglot'

" Elixir
Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" MDX
" Plug 'jxnblk/vim-mdx-js'

" Typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" JavaScript
" Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }
" Plug 'othree/yajs.vim'
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'js', 'jsx'] }
" Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'js', 'jsx'] }
" Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'js', 'jsx'] }

" JSON
Plug 'kevinoid/vim-jsonc'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
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
" Plug 'janko-m/vim-test'

" Peg
" Plug 'gf3/peg.vim'

" Happiness
" Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Olical/vim-enmasse', { 'on': 'EnMasse' }
Plug 'mileszs/ack.vim'
" Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'SirVer/ultisnips'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
" Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'wakatime/vim-wakatime'

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'ryanoasis/vim-devicons'
call plug#end()
