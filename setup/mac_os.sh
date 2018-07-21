#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

print_info "macOS Setup"

ask_for_sudo

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

print_success "Tap to click"

for app in "Finder"; do
  killall "${app}" &> /dev/null
done

print_in_green "   Settings applied"
