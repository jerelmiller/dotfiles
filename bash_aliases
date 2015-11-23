alias grep="grep  --color=auto"
alias egrep="egrep  --color=auto"

alias ga='git add'
alias gcm='git commit -m'
alias gco='git checkout'
alias stash='git stash'
alias pop='git stash pop'
alias show='git show'
alias fetch='git fetch'
alias log='git log'
alias push='git push origin $GIT_BRANCH'
alias pull='git fetch && git pull -v origin $GIT_BRANCH'
alias gd='git diff'
alias gs='git status'
alias gb='git branch'
alias routes='rake routes'
alias bi='bundle install'

if [ -f ~/.bash_aliases.local ]; then
  . ~/.bash_aliases.local
fi
