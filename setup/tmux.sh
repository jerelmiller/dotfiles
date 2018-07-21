#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -r TMUX_DIRECTORY="$HOME/.tmux"
declare -r TPM_LOCATION="$TMUX_DIRECTORY/plugins/tpm"
declare -r TPM_REPO_URL="https://github.com/tmux-plugins/tpm"

install_plugin_manager() {
  if [ ! -d $TPM_LOCATION ]; then
    git clone --quiet $TPM_REPO_URL $TPM_LOCATION
  fi

  print_result $? "tmux (install tpm)"
}

main() {
  print_info "tmux"

  install_plugin_manager
  tmux source $HOME/.tmux.conf
}

main
