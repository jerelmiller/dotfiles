export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
export EDITOR='vim'

PROMPT_COMMAND="updateps1;history -a"

if [ -f $HOME/.bash_aliases ]; then
  . ~/.bash_aliases
fi

updateps1() {
  EXITSTATUS="$?"
  GIT_BRANCH=""
  git rev-parse 2>/dev/null

  if [ $? == "0" ]; then
    GIT_BRANCH="$(git branch |grep '\*' |cut -b3-)"
    PS1='\[\033[1;35m\]'"$(date +%T)"'\[\033[01;36m\] $GIT_BRANCH \[\033[01;33m\]\u\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
  else
    PS1='\[\033[1;35m\]'"$(date +%T)"'\[\033[01;36m\] \[\033[01;33m\]\u\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
  fi
}

