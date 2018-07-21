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

  # Set zsh as login shell
  chsh -s $(command -v zsh)

  print_success "Set login shell"
}

main
