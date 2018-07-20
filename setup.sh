#!/bin/sh

currentdir=$(pwd)

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
  fi
}

if [ ! -f $HOME/.tmux.conf ]; then
  echo "Linking .tmux.conf"
  ln -s $currentdir/tmux.conf $HOME/.tmux.conf
fi

if [ ! -f $HOME/.bash_profile ]; then
  echo "Linking bash profile"
  ln -s $currentdir/bash_profile $HOME/.bash_profile
fi

if [ ! -f $HOME/.bash_aliases ]; then
  echo "Linking bash aliases"
  ln -s $currentdir/bash_aliases $HOME/.bash_aliases
fi

echo "Setting up neovim..."
./scripts/symlink_nvim_dotfiles.sh

echo "Setting up Vim Plug..."
./scripts/setup_vim_plug.sh

echo "Setting up dein..."
./scripts/setup_dein.sh

echo "Installing Tmux plugin manager..."
./scripts/install_tmux_plugin_manager.sh


brew install elixir

brew cask install font-hack-nerd-font

if ! command -v rvm > /dev/null; then
  echo "Installing rvm..."

  curl -sSL https://get.rvm.io | bash -s stable

  echo "Installing latest ruby..."
  rvm install ruby --latest
fi

echo "Configuring ruby..."

gem update --system
gem_install_or_update "bundler"
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

if ! command -v asdf > /dev/null; then
  echo "Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0

  source $HOME/.bash_profile

  echo "Installing asdf Elixir plugin"
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

  echo "Installing asdf Erlang plugin"
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi

if [ ! -d $HOME/code/fonts ]; then
  cd $HOME/code
  git clone git@github.com:powerline/fonts.git
  cd $HOME/code/fonts
  ./install.sh
  cd $currentdir
fi

tic tmux-256color.terminfo
tic tmux-256color-italic.terminfo

source $HOME/.bash_profile
