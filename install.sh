#!/bin/bash

currentdir=$(pwd)

echo "Linking .vimrc"
ln -s $currentdir/vim/vimrc $HOME/.vimrc

echo "Linking .vim"
ln -s $currentdir/vim $HOME/.vim
