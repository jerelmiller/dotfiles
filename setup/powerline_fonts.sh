#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && \
  . ./utils.sh && \
  . ./paths.sh

declare -r FONT_DIRECTORY="$CODE_DIRECTORY/fonts"

clone_fonts() {
  git clone --quiet git@github.com:powerline/fonts.git "$FONT_DIRECTORY"

  print_result $? "Download"
}

install_fonts() {
  pushd $FONT_DIRECTORY &> /dev/null && \
    ./install.sh && \
    popd &> /dev/null

  print_result $? "Install"
}

main() {
  print_info "Powerline fonts"

  if [ ! -d "$FONT_DIRECTORY" ]; then
    mkdir -p "$FONT_DIRECTORY"
    clone_fonts
  fi

  install_fonts
}

main
