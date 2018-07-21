#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

declare -r ASDF_REPO_URL="https://github.com/asdf-vm/asdf.git"

install_asdf() {
  git clone --quiet $ASDF_REPO_URL $ASDF_DIRECTORY && \
    git checkout --quiet $(git describe --abbrev=0 --tags)

  print_result $? "asdf (install)"
}

upgrade_asdf() {
  asdf update

  print_result $? "asdf (upgrade)"
}

plugin_added() {
  asdf plugin-list | grep -Fq "$1"
}

language_installed() {
  local language="$1"
  local version="$2"

  asdf list "$language" | grep -Fq "$version"
}

add_plugin() {
  local name="$1"
  local url="$2"

  if ! plugin_added "$name"; then
    asdf plugin-add "$name" "$url"
  fi

  print_result $? "asdf (add $name)"
}

install_language() {
  local language="$1"
  local latest_version="$(asdf list-all "$language" | grep -v "[a-z]" | tail -1)"

  if ! language_installed $language $latest_version &> /dev/null; then
    ask_for_confirmation "Do you want to install $language ($latest_version) now?"

    if answer_is_yes; then
      asdf install "$language" "$latest_version" && \
        asdf global "$language" "$latest_version"

      print_result $? "asdf (install $language $latest_version)"
    fi
  fi
}

main() {
  print_info "asdf"

  . $ASDF_SOURCE &> /dev/null

  if ! cmd_exists "asdf"; then
    install_asdf
    . $ASDF_SOURCE &> /dev/null
  else
    upgrade_asdf
  fi

  add_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
  add_plugin "erlang" "https://github.com/asdf-vm/asdf-erlang.git"
  add_plugin "elixir" "https://github.com/asdf-vm/asdf-elixir.git"

  install_language "ruby"
  install_language "erlang"
  install_language "elixir"
}

main
