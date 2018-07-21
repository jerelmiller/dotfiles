#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -r NVIM_DIRECTORY="$HOME/.config/nvim"
declare -r VIM_PLUG_LOCATION="$NVIM_DIRECTORY/autoload/plug.vim"
declare -r VIM_PLUG_REPO_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

install_vim_plug() {
  if [ ! -f $VIM_PLUG_LOCATION ]; then
    curl -fLo $VIM_PLUG_LOCATION --create-dirs $VIM_PLUG_REPO_URL
  fi

  print_result $? "neovim (vim plug)"
}

main() {
  print_info "neovim"

  install_vim_plug
}

main
