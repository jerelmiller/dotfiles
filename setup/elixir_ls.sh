#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" && . ./utils.sh

clone_repo() {
  git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls

  print_result $? "elixir_ls (clone)"
}

generate_release() {
  cd ~/.elixir-ls
  mix deps.get && mix compile && mix elixir_ls.release -o release

  print_result $? "elixir_ls (generate release)"
}

main() {
  clone_repo
  generate_release
}

main
