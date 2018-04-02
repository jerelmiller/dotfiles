set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein/')
  call dein#begin('~/.config/nvim/dein/')

  " Let dein manage dein
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Language pack
  call dein#add('sheerun/vim-polyglot')

  " Elixir
  call dein#add('avdgaag/vim-phoenix', { 'on_ft': 'elixir' })
  call dein#add('slashmili/alchemist.vim', { 'on_ft': 'elixir' })

  " Javascript
  call dein#add('moll/vim-node', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('othree/javascript-libraries-syntax.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('neoclide/vim-jsx-improve', { 'on_ft': 'javascript.jsx' })
  call dein#add('1995eaton/vim-better-javascript-completion', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('carlitux/deoplete-ternjs', { 'build': 'npm install -g tern' })

  " GraphQL
  call dein#add('jparise/vim-graphql')

  " Ruby
  call dein#add('tpope/vim-rails', { 'on_ft': 'ruby' })

  " Text
  call dein#add('PeterRincker/vim-argumentative')
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-repeat')
  call dein#add('vim-scripts/ruby-matchit', { 'on_ft': 'ruby' })
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-datetime')
  call dein#add('kana/vim-textobj-function')
  call dein#add('lucapette/vim-textobj-underscore')
  call dein#add('nelstrom/vim-textobj-rubyblock')
  call dein#add('thinca/vim-textobj-function-javascript', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('vim-scripts/matchit.zip')

  " Typescript
  call dein#add('HerringtonDarkholme/yats.vim', { 'on_ft': 'typescript' })
  call dein#add('mhartington/nvim-typescript', { 'on_ft': 'typescript' })

  " Tests
  call dein#add('janko-m/vim-test')

  " Happiness
  call dein#add('airblade/vim-gitgutter')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('Olical/vim-enmasse', { 'on_cmd': 'EnMasse' })
  call dein#add('rking/ag.vim')
  call dein#add('sbdchd/neoformat')
  call dein#add('scrooloose/nerdtree', { 'on_cmd': ['NERDTreeToggle', 'NERDTreeFind'] })
  call dein#add('SirVer/ultisnips')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-obsession')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('wakatime/vim-wakatime')
  call dein#add('w0rp/ale')

  " Syntax Highlighting color schemes
  call dein#add('kristijanhusak/vim-hybrid-material')
  call dein#add('ryanoasis/vim-devicons')

  call dein#end()
  call dein#save_state()

  if dein#check_install()
    call dein#install()
  endif
endif
