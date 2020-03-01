#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

cask_install() {
  local formula="$1"
  local options="$2"

  if brew cask list $formula &> /dev/null; then
    print_success "$formula"
  else
    brew cask install $formula $options

    print_result $? "$formula"
  fi
}

print_info "Install brew-cask packages"

# Browsers
cask_install google-chrome
cask_install firefox
cask_install firefox-developer-edition
cask_install safari-technology-preview
cask_install brave

# Dev
cask_install iterm2
cask_install visual-studio-code
cask_install visualboyadvance-m
cask_install ngrok
cask_install docker
cask_install google-cloud-sdk

# Misc
cask_install 1password
cask_install slack
cask_install spotify
cask_install spectacle

# Fonts
cask_install font-hack-nerd-font
