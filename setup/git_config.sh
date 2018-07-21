#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . ./utils.sh

print_info "Git config"

git config --global color.ui true

print_success "color"

git config --global user.name "Jerel Miller"
git config --global user.email "jerelmiller@gmail.com"

print_success "user"

git config --global github.user jerelmiller

print_success "github"

git config --global core.editor nvim
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

print_success "core"

git config --global alias.graph "log --graph --oneline --decorate"

print_success "alias"
