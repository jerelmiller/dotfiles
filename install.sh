#!/bin/bash

currentdir=$(pwd)

echo "Linking .vimrc"
ln -s $currentdir/vim/vimrc $HOME/.vimrc

echo "Linking .vim"
ln -s $currentdir/vim $HOME/.vim

echo "Linking .tmux.conf"
ln -s $currentdir/tmux.conf $HOME/.tmux.conf
