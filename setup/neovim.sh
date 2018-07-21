#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -r NVIM_DIRECTORY="$HOME/.config/nvim"
declare -r VIM_PLUG_LOCATION="$NVIM_DIRECTORY/autoload/plug.vim"
declare -r VIM_PLUG_REPO_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

install_neovim() {
   pip install neovim && pip3 install neovim

   print_result $? "neovim (install)"
}

install_vim_plug() {
  if [ ! -f $VIM_PLUG_LOCATION ]; then
    curl -fLo $VIM_PLUG_LOCATION --create-dirs $VIM_PLUG_REPO_URL
  fi

  print_result $? "neovim (vim plug)"
}

install_ruby_gem() {
  gem install neovim

  print_result $? "neovim (ruby gem)"
}

main() {
  print_info "neovim"

  install_neovim
  install_vim_plug
  install_ruby_gem
}

main
