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
brew_install gh

brew_install git-recent

brew_install tmux

brew_install yarn

# required by asdf
brew_install asdf
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
brew_install dockutil
brew_install python3
brew_install wireguard-tools
brew_install jq
brew_install rbenv
brew_install fabianishere/personal/pam_reattach
brew_install pyenv
brew_install kubernetes-cli
brew_install vault
brew_install glow

# easily create localhost certificates
brew_install mkcert
brew_install nss

# node canvas requirements
brew_install pkg-config
brew_install cairo
brew_install pango
brew_install libpng
brew_install jpeg
brew_install giflib
brew_install librsvg

# zsh
brew_install zsh
brew_install zsh-completions
brew_install zsh-syntax-highlighting
