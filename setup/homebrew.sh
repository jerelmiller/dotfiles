#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

get_homebrew_git_config_file_path() {
  local path=""

  if path="$(brew --repository 2> /dev/null)/.git/config"; then
    printf "%s" "$path"
    return 0
  else
    print_error "Homebrew (get config file path)"
    return 1
  fi
}

install_homebrew() {
  if ! cmd_exists "brew"; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  print_result $? "Homebrew"
}

install_brew_cask() {
  brew tap homebrew/cask

  print_result $? "Homebrew (cask)"
}

install_brew_cask_versions() {
  brew tap homebrew/cask-versions

  print_result $? "Homebrew (cask-versions)"
}

install_brew_fonts() {
  brew tap caskroom/fonts

  print_result $? "Homebrew (fonts)"
}

install_brew_command_not_found() {
  brew tap homebrew/command-not-found

  print_result $? "Homebrew (command-not-found)"
}

opt_out_of_analytics() {
  local path=""

  # Try to get the path of the `Homebrew` git config file.
  path="$(get_homebrew_git_config_file_path)" || return 1

  # Opt-out of Homebrew's analytics.
  # https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out
  if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
    git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
  fi

  print_result $? "Homebrew (opt-out of analytics)"
}

main() {
  print_info "homebrew"

  install_homebrew
  opt_out_of_analytics
  install_brew_cask
  install_brew_cask_versions
  install_brew_command_not_found
  install_brew_fonts

  brew update
  brew upgrade
}

main
