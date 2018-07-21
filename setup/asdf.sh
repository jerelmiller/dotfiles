#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

declare -r ASDF_DIRECTORY="$HOME/.asdf"
declare -r ASDF_REPO_URL="https://github.com/asdf-vm/asdf.git"

install_asdf() {
  git clone --quiet $ASDF_REPO_URL $ASDF_DIRECTORY && \
    git checkout --quiet $(git describe --abbrev=0 --tags)

  print_result $? "asdf (install)"
}

upgrade_asdf() {
  cd $ASDF_DIRECTORY && \
    git fetch --quiet origin && \
    git checkout --quiet $(git describe --abbrev=0 --tags)

  print_result $? "asdf (upgrade)"
}

plugin_added() {
  asdf plugin-list | grep -Fq "$1"
}

add_plugin() {
  local name="$1"
  local url="$2"

  if ! plugin_added "$name"; then
    asdf plugin-add "$name" "$url"
  fi

  print_result $? "asdf (add $name)"
}

main() {
  print_info "asdf"

  if [ ! -d "$ASDF_DIRECTORY" ]; then
    install_asdf
  else
    upgrade_asdf
  fi

  . $ASDF_DIRECTORY/asdf.sh

  add_plugin "ruby"
  add_plugin "elixir"
  add_plugin "erlang"
}

main
