#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

configure_gpg() {
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

  print_result $? "rvm (gpg)"
}

download_installer() {
  curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer && \
    curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc

  print_result $? "rvm (download install)"
}

verify_gpg() {
  gpg --verify rvm-installer.asc

  print_result $? "rvm (verify)"
}

cleanup() {
  rm -f rvm-installer &> /dev/null
  rm -f rvm-installer.asc &> /dev/null
}

install_rvm() {
  bash rvm-installer stable

  print_result $? "rvm (install)"
}

install_latest_ruby() {
  rvm use ruby --install --latest

  print_result $? "rvm (install latest Ruby)"
}

main() {
  print_info "rvm"

  if ! cmd_exists "rvm"; then
    configure_gpg
    download_installer
    install_rvm
  fi

  install_latest_ruby

  cleanup
}

main
