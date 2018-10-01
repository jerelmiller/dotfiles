#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

initialize() {
  rbenv init &> /dev/null

  # rbenv init exits with 1 for some reason
  print_success "rbenv (init)"
}

add_config() {
  append_to_shell_config "eval \"\$(rbenv init -)\""

  source_local_config

  print_result $? "rbenv (update $LOCAL_SHELL_CONFIG_FILE)"
}

main() {
  print_info "rbenv"

  source_local_config
  initialize
  add_config
}

main
