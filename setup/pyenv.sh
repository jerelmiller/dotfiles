#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

install() {
  pip install --user --upgrade pynvim
  pip3 install --user --upgrade pynvim

  print_success "pyenv (install)"
}

main() {
  print_info "pyenv"

  install
}

main
