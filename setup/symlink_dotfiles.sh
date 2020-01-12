#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -a SHELL_FILES_TO_SYMLINK=(
  "shell/agignore"
  "shell/bash_profile"
  "shell/bash_aliases"
  "shell/tmux.conf"
  "shell/ideavimrc"
  "shell/zshrc"
  "shell/xvimrc"
  "shell/aliases"
  "shell/psqlrc"
  "shell/prettierrc.js"
)

declare -a FOLDERS_TO_SYMLINK=(
  "config/nvim"
)

symlink_shell_file() {
  local name="$1"
  local source_file="$(cd .. && pwd)/$name"
  local target_file="$HOME/.$(basename "$name")"

  maybe_symlink_file $source_file $target_file
}

symlink_folder() {
  local source_folder="$(cd .. && pwd)/$1"
  local target_folder="$HOME/.$1"

  maybe_symlink_file $source_folder $target_folder
}

symlink_binstubs() {
  local source_file="$1"
  local target_file="/usr/local/bin/$(basename "$source_file")"

  maybe_symlink_file $source_file $target_file
}

main() {
  print_info "Symlink dotfiles"

  for i in ${SHELL_FILES_TO_SYMLINK[@]}; do
    symlink_shell_file $i
  done

  for i in ${FOLDERS_TO_SYMLINK[@]}; do
    symlink_folder $i
  done

  for filename in $(cd .. && pwd)/bin/*; do
    symlink_binstubs $filename
  done
}

main
