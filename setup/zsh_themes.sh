#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

install_custom_plugin() {
  local git_path=$1
  local theme_name=$2
  local custom_dir="$ZSH/custom"
  local theme_path="$custom_dir/themes/$(basename $git_path)"

  if [ ! -d $theme_path ]; then
    git clone "https://github.com/$git_path" "$theme_path"
  fi

  ln -sf "$theme_path/$theme_name.zsh-theme" "$custom_dir/themes/$theme_name.zsh-theme"

  print_success "zsh (theme $1)"
}

main() {
  print_info "zsh themes"

  install_custom_plugin "denysdovhan/spaceship-prompt" "spaceship"
}

main
