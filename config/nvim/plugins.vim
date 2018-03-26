call plug#begin('~/.config/nvim/plugged')
" Elixir
Plug 'avdgaag/vim-phoenix'

"JavaScript
Plug 'othree/yajs.vim', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'js', 'jsx'] }
Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" HTML
Plug 'othree/html5.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Ruby
Plug 'tpope/vim-rails'

" Text
Plug 'PeterRincker/vim-argumentative'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-function'
Plug 'lucapette/vim-textobj-underscore'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thinca/vim-textobj-function-javascript', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] }

" Tests
Plug 'janko-m/vim-test'

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
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'w0rp/ale'

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
call plug#end()
