#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -a FILES_TO_SYMLINK=(
  "shell/agignore"
  "shell/bash_profile"
  "shell/bash_aliases"
  "shell/tmux.conf"
  "config/nvim"
)

symlink_file() {
  ln -fs $1 $2

  print_result $? "$1 → $2"
}

symlink_source() {
  local name="$1"
  local source_file="$(cd .. && pwd)/$name"
  local target_file="$HOME/.$(printf "%s" "$name" | sed "s/.*\/\(.*\)/\1/g")"

  if [ ! -e "$target_file" ]; then
    symlink_file $source_file $target_file
  elif [ "$(readlink "$target_file")" == "$source_file" ]; then
    print_success "$target_file → $source_file"
  else
    ask_for_confirmation "'$target_file' already exists, do you want to overwrite it?"

    if answer_is_yes; then
      rm -rf "$target_file"
      symlink_file $source_file $target_file
    fi
  fi
}

main() {
  print_info "Symlink dotfiles"

  for i in ${FILES_TO_SYMLINK[@]}; do
    symlink_source $i
  done
}

main
