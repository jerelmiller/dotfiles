#!/bin/bash

currentdir=$(pwd)

echo "Linking .vimrc"
ln -s $currentdir/vim/vimrc $HOME/.vimrc

echo "Linking .vim"
ln -s $currentdir/vim $HOME/.vim

echo "Linking .tmux.conf"
ln -s $currentdir/tmux.conf $HOME/.tmux.conf

echo "Adding bundle dir"
mkdir $HOME/.vim/bundle

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Adding bash aliases"
ln -s $currentdir/bash_aliases $HOME/.bash_aliases
source $HOME/.bashrc
