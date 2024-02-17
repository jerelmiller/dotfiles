export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  asdf
  fnm
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

PATH=$HOME/.local/bin:$PATH

export EDITOR='nvim'

eval "$(fnm env --use-on-cd)"

bindkey "^H" backward-delete-word

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
