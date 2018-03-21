#!/bin/sh
currentdir=$(pwd)

if [ ! -d $HOME/.config/nvim ]; then
  mkdir -p $HOME/.config/nvim
fi

ln -s $currentdir/config/nvim $HOME/.config/nvim
