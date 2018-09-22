#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

main() {
  print_info "rbenv"

  source_local_config

  rbenv init
}
