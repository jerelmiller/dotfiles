#!/bin/sh

 curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
 chmod +x ./installer.sh
 ./installer.sh ~/.config/nvim/dein/
 rm -i installer.sh
