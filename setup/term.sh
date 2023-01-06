#!/bin/sh


cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh


print_warning "Follow this guide: https://dev.to/jibundit/undercurl-display-on-neovim-and-tmux-with-iterm2-3pi0"

# declare -r BASE_DIR=$(cd .. && pwd)

# main() {
#   print_info "term"

#   tic $BASE_DIR/tmux-256color.terminfo
#   print_result $? "tmux-256color"

#   tic $BASE_DIR/tmux-256color-italic.terminfo
#   print_result $? "tmux-256color-italic"
# }

# main
