#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

print_info "macOS Setup"

ask_for_sudo

./close_system_preferences_panes.applescript

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

print_success "Tap to click"

# Much faster keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

print_success "Key repeat"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder: Make column-view the preferred view
defaults write com.apple.finder FXPreferredViewStyle clmv

print_success "Finder"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

print_success "Dock"

# Avoid creating '.DS_Store' files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Save screenshots in iCloud Drive
defaults write com.apple.screencapture location $ICLOUD_DRIVE/Screenshots

print_success "Screenshot location"

for app in "Finder" \
           "Dock" \
           "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
