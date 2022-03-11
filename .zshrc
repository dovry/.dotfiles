# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

BIN=${0/#[!\/]/"$PWD/${0:0:1}"}; 
export DOT_LOC=${BIN%/*}

ZSH_THEME="cypher"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_UPDATE_PROMPT="true"

plugins=(
  ansible
  autojump
  command-not-found
  copyfile
  dircycle
  dirhistory
  docker
  docker-compose
  git
  git-extras
  perms
  sudo
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    EDITOR='code'
fi

if [ -f "$HOME/.config/.qfc/bin/qfc.sh" ]; then
# git clone https://github.com/pindexis/qfc $HOME/.config/.qfc
  [[ -s "$HOME/.config/.qfc/bin/qfc.sh" ]] && source "$HOME/.config/.qfc/bin/qfc.sh"
  qfc_quick_command 'cd' '\C-b' 'cd $0'
  qfc_quick_command 'vim' '\C-p' 'vim $0'
fi

# check for ssh / ssh-agent
if [[ -n $(command -v ssh-agent) ]]; then
  eval `ssh-agent` > /dev/null 2>&1
  
  for possiblekey in "$HOME"/.ssh/*; do
    if grep -q PRIVATE "$possiblekey"; then
      ssh-add "$possiblekey" > /dev/null 2>&1
    fi
  done
fi

if [[ -n $(command -v ssh) ]]; then
  _ssh() 
  {
      local cur prev opts
      COMPREPLY=()
      cur="${COMP_WORDS[COMP_CWORD]}"
      prev="${COMP_WORDS[COMP_CWORD-1]}"
      opts=$(grep '^Host' ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)
  
      COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
      return 0
  }
  complete -F _ssh ssh
fi

source "$ZSH"/oh-my-zsh.sh
