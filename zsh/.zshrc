export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  fnm
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export PATH=$HOME/.local/bin:$PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH=$(brew --prefix rustup)/bin:$PATH

export EDITOR='nvim'

# Keep shell history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

export NODE_OPTIONS="--no-deprecation --disable-warning=ExperimentalWarning"

eval "$(fnm env --use-on-cd)"
eval "$(rbenv init - zsh)"

bindkey "^H" backward-delete-word

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# opencode
export PATH=/Users/jerelmiller/.opencode/bin:$PATH

eval "$(mise activate zsh)"
