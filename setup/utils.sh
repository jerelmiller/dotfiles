#!/bin/sh

. ./paths.sh

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

ask() {
  print_question "$1"
  read -r
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -r -n 1
  printf "\n"
}

ask_for_sudo() {
  # Ask for the administrator password upfront.
  sudo -v &> /dev/null

  # Update existing `sudo` time stamp
  # until this script has finished.
  #
  # https://gist.github.com/cowboy/3118588
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &
}

cmd_exists() {
  command -v "$1" &> /dev/null
}

print_in_color() {
  printf "%b" \
    "$(tput setaf "$2" 2> /dev/null)" \
    "$1" \
    "$(tput sgr0 2> /dev/null)"
}

print_in_green() {
  print_in_color "$1" 2
}

print_in_purple() {
  print_in_color "$1" 5
}

print_in_red() {
  print_in_color "$1" 1
}

print_in_yellow() {
  print_in_color "$1" 3
}

print_question() {
  print_in_yellow "   [?] $1"
}

print_result() {
  if [ "$1" -eq 0 ]; then
    print_success "$2"
  else
    print_error "$2"
  fi

  return "$1"
}

print_success() {
  print_in_green "   [✔] $1\n"
}

print_warning() {
  print_in_yellow "   [!] $1\n"
}

print_error() {
  print_in_red "   [✖] $1 $2\n"
}

print_info() {
  print_in_purple "\n $1\n\n"
}

append_to_shell_config() {
  local text="$1"
  local skip_new_line="${2:-0}"

  if [ ! -w "$LOCAL_SHELL_CONFIG_FILE" ]; then
    print_error ".zshrc.local is not writable"
    return 1
  fi

  if ! grep -Fqs "$text" "$LOCAL_SHELL_CONFIG_FILE"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\\n" "$text" >> "$LOCAL_SHELL_CONFIG_FILE"
    else
      printf "\\n%s\\n" "$text" >> "$LOCAL_SHELL_CONFIG_FILE"
    fi
  fi
}

source_config() {
  . $LOCAL_SHELL_CONFIG_FILE
}
