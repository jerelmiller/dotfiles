#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  printf "\\n$fmt\\n" "$@"
}

setup_ssh_key() {
  fancy_echo "Generating ssh key..."
  ssh-keygen -t rsa -b 4096 -C "jerelmiller@gmail.com"

  fancy_echo "Starting ssh-agent"
  eval "$(ssh-agent -s)"

  fancy_echo "Adding SSH key to agent"
  ssh-add $HOME/.ssh/id_rsa

  pbcopy < $HOME/.ssh/id_rsa.pub

  fancy_echo "Copied ssh key. Please visit Github to add this ssh key and re-run this script."

  exit 0
}

install_xcode_clt() {
  # Prompt to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  # Prompt to agree to the terms of the Xcode license
  sudo xcodebuild -license
}

main() {
  if [ ! -d $HOME/.ssh ] ||  [ ! -f $HOME/.ssh/id_rsa.pub ]; then
    setup_ssh_key
  fi

  if ! xcode-select --print-path &> /dev/null; then
    install_xcode_clt
  fi

  # Put all code in code folder
  mkdir $HOME/code &> /dev/null

  if [ ! -d $HOME/code/dotfiles ]; then
    git clone git@github.com:jerelmiller/dotfiles.git $HOME/code/dotfiles
  fi

  fancy_echo "Success. When ready, run \"setup.sh\" inside of the dotfiles directory"
}

main
