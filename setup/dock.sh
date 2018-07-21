#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

application() {
  "/Applications/$1.app"
}

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

arrange_apps() {
  dockutil --add /Applications/Mail.app --position 1 &> /dev/null
  dockutil --move "Calendar" --position 2
  dockutil --add /Applications/Slack.app --position 3 &> /dev/null
  dockutil --move "Safari" --position 4
  dockutil --add /Applications/Firefox.app --position 5 &> /dev/null
  dockutil --add "/Applications/Firefox Developer Edition.app" --position 6 &> /dev/null
  dockutil --add "/Applications/Google Chrome.app" --position 7 &> /dev/null
  dockutil --add "/Applications/iTerm.app" --position 8 &> /dev/null
  dockutil --add "/Applications/Utilities/Terminal.app" --position 9 &> /dev/null
  dockutil --move "Messages" --position 10 &> /dev/null
  dockutil --add "/Applications/Spotify.app" --position 11 &> /dev/null
  dockutil --move "iTunes" --position 12 &> /dev/null
  dockutil --move "Notes" --position 13 &> /dev/null

  print_success "Arrange apps"
}

main() {
  print_info "Dock"

  remove_unwanted_apps
  arrange_apps
}

main
