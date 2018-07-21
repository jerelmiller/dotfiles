#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && \
  . ./utils.sh && \
  . ./paths.sh

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  print_result $? "zsh (install)"
}

set_login_shell() {
  chsh -s $(command -v zsh)

  print_success "Set login shell"
}

create_file() {
  touch $LOCAL_SHELL_CONFIG_FILE
  chmod 744 $LOCAL_SHELL_CONFIG_FILE

  print_success "Create local shell config file"
}

main() {
  print_info "zsh"

  install_oh_my_zsh
  set_login_shell
  create_file
}

main
