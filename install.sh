#!/bin/sh

currentdir=$(pwd)

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
  fi
}

if [ ! -f $HOME/.vimrc ]; then
  echo "Linking .vimrc"
  ln -s $currentdir/vim/vimrc $HOME/.vimrc
fi

if [ ! -d $HOME/.vim  ]; then
  echo "Linking .vim"
  ln -s $currentdir/vim $HOME/.vim
fi

if [ ! -f $HOME/.tmux.conf ]; then
  echo "Linking .tmux.conf"
  ln -s $currentdir/tmux.conf $HOME/.tmux.conf
fi

if [ ! -d $HOME/.vim/bundle ]; then
  echo "Adding bundle dir"
  mkdir $HOME/.vim/bundle
fi

if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
  echo "Installing Vim Plug"
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f $HOME/.bash_profile ]; then
  echo "Adding bash profile"
  ln -s $currentdir/bash_profile $HOME/.bash_profile
fi

if [ ! -f $HOME/.bash_aliases ]; then
  echo "Adding bash aliases"
  ln -s $currentdir/bash_aliases $HOME/.bash_aliases
fi

if ! command -v brew > /dev/null; then
  echo "Installing homebrew..."

  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if brew list | grep -Fq brew-cask; then
  echo "Uninstalling old Homebrew-Cask..."
  brew uninstall --force brew-cask
fi

echo "Updating homebrew formulae..."
brew update

brew install git
brew install openssl
brew install the_silver_searcher
brew install tmux
brew install vim
brew install mysql
brew install postgres

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

source ~/.bash_profile

if ! command -v nvm > /dev/null; then
  echo "Installing nvm..."

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.6/install.sh | bash

  nvm install node
fi
