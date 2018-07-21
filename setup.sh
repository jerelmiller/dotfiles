#!/bin/sh

currentdir=$(pwd)

echo "Setting up dein..."
./scripts/setup_dein.sh


if [ ! -d $HOME/code/fonts ]; then
  cd $HOME/code
  git clone git@github.com:powerline/fonts.git
  cd $HOME/code/fonts
  ./install.sh
  cd $currentdir
fi

source $HOME/.bash_profile
