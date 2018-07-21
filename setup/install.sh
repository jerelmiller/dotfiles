#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

ask_for_sudo

./xcode.sh
./homebrew.sh

./symlink_dotfiles.sh

./brew_install.sh
./brew_cask_install.sh

./nvm.sh
./asdf.sh

./ruby.sh

./term
./neovim
./tmux

source $HOME/.bash_profile
