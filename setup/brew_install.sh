#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

brew_install() {
  local formula="$1"
  local options="$2"

  if brew list $formula &> /dev/null; then
    print_success "$formula"
  else
    brew install $formula $options

    print_result $? "$formula"
  fi
}

print_info "Install homebrew packages"

brew_install git
brew_install hub

brew_install tmux
brew_install reattach-to-user-namespace

brew_install yarn --without-node

brew_install heroku-toolbelt

# required by asdf
brew_install coreutils
brew_install automake
brew_install autoconf
brew_install libyaml
brew_install readline
brew_install libxslt
brew_install libtool
brew_install unixodbc

# Storage/caching
brew_install postgres
brew_install redis

# Misc
brew_install openssl
brew_install neovim
brew_install the_silver_searcher
brew_install imagemagick
brew_install cmake
brew_install gpg2
brew_install libxml2
brew_install ffmpeg
brew_install youtube-dl
brew_install watchman
brew install dockutil
brew install python3
brew install zsh
