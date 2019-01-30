#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

declare -a VSCODE_DIR="$HOME/Library/Application Support/Code/User"

declare -a FILES_TO_SYMLINK=(
  "vscode/settings.json"
  "vscode/keybindings.json"
  "vscode/snippets/"
)

setup_key_repeating() {
  # Enable key repeating https://github.com/VSCodeVim/Vim#mac-setup
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

  print_result $? "vscode (enable key repeating)"
}

symlink_settings_file() {
  local name="$1"
  local source_file="$(cd .. && pwd)/$name"
  local target_file="$VSCODE_DIR/$(basename "$name")"

  maybe_symlink_file "$source_file" "$target_file"
}

symlink_settings() {
  print_info "Symlink settings"

  for i in ${FILES_TO_SYMLINK[@]}; do
    symlink_settings_file $i
  done
}

install_extensions() {
  ask_for_confirmation "Would you like to install extensions?"

  if answer_is_yes; then
    cat ../vscode/extensions | xargs -L 1 /usr/local/bin/code --install-extension
  fi
}

main() {
  setup_key_repeating
  symlink_settings
  install_extensions
}

main
