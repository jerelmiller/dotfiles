shopt -s expand_aliases

##### GENERAL #####
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias resource='source $HOME/.bash_profile'
alias finder='open -a Finder'

alias icloud_drive='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# make destructive commands interactive to prevent disasters
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

##### GIT #####
alias ga='git add'
alias gcm='git commit -m'
alias gcM='gcm'
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

##### DOCKER #####
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

docker_remove_all() {
  docker kill $(docker ps -q)
  docker_clean_ps
  docker rmi $(docker images -a -q)
}

setup_git_hook() {
  cat << 'EOF' > .git/hooks/prepare-commit-msg
#!/bin/bash

BRANCH_NAME=$(git symbolic-ref --short HEAD)
ISSUE_NUM="${BRANCH_NAME##*/}"
BRANCH_IN_COMMIT=$(grep -c "\[$ISSUE_NUM\]" $1)

if [ -n "$ISSUE_NUM" ] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then
   sed -i.bak -e "/^\[/! s/^/[$ISSUE_NUM] /" $1
fi
EOF
  chmod +x .git/hooks/prepare-commit-msg
}

##### NODE #####
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'

if [ -f ~/.bash_aliases.local ]; then
  . ~/.bash_aliases.local
fi
