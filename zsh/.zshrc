export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  fnm
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export EDITOR='nvim'

eval "$(fnm env --use-on-cd)"

bindkey "^H" backward-delete-word

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
