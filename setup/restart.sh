#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

main() {
  print_info "Restart"

  ask_for_confirmation "Would you like to restart?"

  if answer_is_yes; then
    sudo shutdown -r now
  fi
}

main
