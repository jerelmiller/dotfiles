#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

print_info "Install homebrew packages"

brew install git
brew install hub

brew install tmux
brew install reattach-to-user-namespace

brew install yarn --without-node

brew install heroku-toolbelt

# required by asdf
brew install coreutils
brew install automake
brew install autoconf
brew install libyaml
brew install readline
brew install libxslt
brew install libtool
brew install unixodbc

# Storage/caching
brew install postgres
brew install redis

# Misc
brew install openssl
brew install neovim
brew install the_silver_searcher
brew install imagemagick
brew install cmake
brew install gpg2
brew install libxml2
brew install ffmpeg
brew install youtube-dl
brew install watchman
