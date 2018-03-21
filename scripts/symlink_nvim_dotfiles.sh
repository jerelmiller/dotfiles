#!/bin/sh
if [ ! -d $HOME/.config/nvim ]; then
  ln -s $PWD/config/nvim $HOME/.config/nvim
fi
