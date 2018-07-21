#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

print_info "Install brew-cask packages"

# Browsers
brew cask install google-chrome
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install safari-technology-preview
brew cask install brave

# Dev
brew cask install iterm2
brew cask install visual-studio-code
brew cask install visualboyadvance-m
brew cask install ngrok

# Misc
brew cask install 1password
brew cask install slack
brew cask install spotify
brew cask install spectacle

# Fonts
brew cask install font-hack-nerd-font
