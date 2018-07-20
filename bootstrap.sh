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
}

fancy_echo "Setting up your new mac."

if [ ! -d $HOME/.ssh ] ||  [ ! -f $HOME/.ssh/id_rsa.pub ]; then
  setup_ssh_key

  pbcopy < $HOME/.ssh/id_rsa.pub

  fancy_echo "Copied ssh key. Please visit Github to add this ssh key and re-run this script."

  exit 0
fi

mkdir $HOME/code

git clone git@github.com:jerelmiller/dotfiles.git $HOME/code/dotfiles
