#!/bin/sh

# Point the `xcode-select` developer directory to
# the appropriate directory from within `Xcode.app`
# https://github.com/alrra/dotfiles/issues/13
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
