#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

declare -r NVM_GIT_REPO_URL="https://github.com/creationix/nvm.git"

# Fixes issue when opening tmux
# https://github.com/creationix/nvm/issues/1652#issuecomment-341845299
declare -r PINNED_VERSION=v0.33.4

add_nvm_configs() {
  append_to_shell_config "export NVM_DIR=\"\$HOME/.nvm\""
  append_to_shell_config "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"" 1

  . $LOCAL_SHELL_CONFIG_FILE

  print_result $? "nvm (update $LOCAL_SHELL_CONFIG_FILE)"
}

install_nvm() {
  git clone --quiet $NVM_GIT_REPO_URL $NVM_DIRECTORY && \
    git checkout --quiet "$PINNED_VERSION"

  print_result $? "nvm (install)"
}

update_nvm() {
  cd $NVM_DIRECTORY && \
    git fetch --quiet origin && \
    git checkout --quiet "$PINNED_VERSION" && \
    . $NVM_DIRECTORY/nvm.sh

  print_result $? "nvm (upgrade)"
}

install_latest_stable_node() {
  # Install the latest stable version of Node
  # (this will also set it as the default).
  . $LOCAL_SHELL_CONFIG_FILE

  nvm install node && \
    nvm alias default node && \
    nvm use default

  print_result $? "nvm (install latest Node)"
}

main() {
  print_info "nvm"

  if [ ! -d "$NVM_DIRECTORY" ]; then
    install_nvm
    add_nvm_configs
  else
    update_nvm
  fi

  install_latest_stable_node
}

main
