#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

using_system_ruby() {
  [ "$(command -v ruby)" == "$SYSTEM_RUBY_BIN" ]
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"

    print_result $? "ruby (update $1)"
  else
    gem install "$@"

    print_result $? "ruby (install $1)"
  fi
}

update_rubygems() {
  gem update --system

  print_result $? "ruby (update system)"
}

configure_bundler() {
  local number_of_cores=$(sysctl -n hw.ncpu)

  bundle config --global jobs $((number_of_cores - 1))

  print_result $? "ruby (configure bundler)"
}

main() {
  print_info "ruby"

  . $LOCAL_SHELL_CONFIG_FILE &> /dev/null

  if using_system_ruby; then
    print_warning "Using system ruby. Skipping ruby setup..."
    return 0
  fi

  update_rubygems
  gem_install_or_update "bundler"
  configure_bundler
}

main
