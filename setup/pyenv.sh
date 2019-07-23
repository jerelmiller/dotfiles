#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

install() {
  pip install --user --upgrade pynvim
  pip3 install --user --upgrade pynvim

  print_success "pyenv (install)"
}

install_version() {
  pyenv install "$1" > /dev/null;

  print_result $? "pyenv (install version $1)"
}

pip_install() {
  pip3 install "$1"

  print_result $? "pip install ($1)"
}

main() {
  print_info "pyenv"

  install
  install_version 3.7.4
  pip_install pynvim
}

main
