#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

install_custom_plugin() {
  local git_path=$1
  local plugin_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$(basename $git_path)"

  if [ ! -d $plugin_path ]; then
    git clone "https://github.com/$git_path" "$plugin_path"
  fi

  print_result $? "zsh (install $1)"
}

main() {
  print_info "zsh plugins"

  install_custom_plugin "zsh-users/zsh-autosuggestions"
}

main
