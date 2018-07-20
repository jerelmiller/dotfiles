#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -r $RVM_DIRECTORY="$HOME/.rvm"

install_rvm() {
  curl -sSL https://get.rvm.io | bash -s stable

  print_result $? "rvm (install)"
}

install_latest_ruby() {
  rvm use ruby --install --latest

  print_result $? "rvm (install latest Ruby)"
}

main() {
  print_info "rvm"

  if ! cmd_exists "rvm"; then
    install_rvm
  fi

  . $RVM_DIRECTORY/scripts/rvm
  install_latest_ruby
}

main
