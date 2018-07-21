#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -r BASE_DIR=$(cd .. && pwd)

main() {
  print_info "term"

  tic $BASE_DIR/tmux-256color.terminfo
  print_result $? "tmux-256color"

  tic $BASE_DIR/tmux-256color-italic.terminfo
  print_result $? "tmux-256color-italic"
}

main
