#!/bin/sh
if [ ! -d $HOME/.config/nvim ]; then
  mkdir -p $HOME/.config/nvim
fi

ln -s $PWD/config/nvim $HOME/.config/nvim
