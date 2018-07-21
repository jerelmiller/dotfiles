#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

remove_unwanted_apps() {
  dockutil \
    --remove "App Store" \
    --remove "Contacts" \
    --remove "FaceTime" \
    --remove "iBooks" \
    --remove "Launchpad" \
    --remove "Maps" \
    --remove "Photos" \
    --remove "Reminders" \
    --remove "Siri" \
    &>/dev/null


  print_success "Remove unwanted apps"
}

main() {
  print_info "Dock"

  remove_unwanted_apps
}

main
