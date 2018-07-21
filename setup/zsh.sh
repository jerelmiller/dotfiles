#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && \
  . ./utils.sh

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  print_result $? "zsh (install)"
}

main() {
  print_info "zsh"

  install_oh_my_zsh
}

main
