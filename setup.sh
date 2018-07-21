#!/bin/sh

currentdir=$(pwd)

echo "Setting up Vim Plug..."
./scripts/setup_vim_plug.sh

echo "Setting up dein..."
./scripts/setup_dein.sh

echo "Installing Tmux plugin manager..."
./scripts/install_tmux_plugin_manager.sh


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
