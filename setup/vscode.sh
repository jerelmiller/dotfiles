#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

main() {
  # Enable key repeating https://github.com/VSCodeVim/Vim#mac-setup
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

  print_result $? "vscode (enable key repeating)"
}

main
