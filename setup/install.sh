#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh


./xcode.sh
./homebrew.sh

./symlink_dotfiles.sh

./brew_install.sh
./brew_cask_install.sh

./nvm.sh
./asdf.sh

./ruby.sh

./term.sh
./neovim.sh
./tmux.sh

./git_config.sh
./powerline_fonts.sh

./mac_os.sh

./restart.sh

source $HOME/.bash_profile
