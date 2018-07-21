#!/bin/sh

currentdir=$(pwd)

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
