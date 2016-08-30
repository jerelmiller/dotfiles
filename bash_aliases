##### GENERAL #####
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# make destructive commands interactive to prevent disasters
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

##### GIT #####
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

##### RAILS/RUBY ######
alias routes='rake routes'
alias bi='bundle install'
alias migrate='rake db:migrate'

##### NAVIGATION ######
alias code='cd $HOME/code'
alias ..='cd ..'

if [ -f ~/.bash_aliases.local ]; then
  . ~/.bash_aliases.local
fi
