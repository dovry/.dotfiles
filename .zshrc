# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cypher"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
  tmux
  vagrant
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

if [ -f "$HOME/.config/.qfc/bin/qfc.sh" ]; then
# git clone https://github.com/pindexis/qfc $HOME/.config/.qfc
  [[ -s "$HOME/.config/.qfc/bin/qfc.sh" ]] && source "$HOME/.config/.qfc/bin/qfc.sh"
  qfc_quick_command 'cd' '\C-b' 'cd $0'
  qfc_quick_command 'vim' '\C-p' 'vim $0'
fi

## Export functions
#for i in $(grep -Po "\w+ \(\)" .shell_functions | awk '{ print $1 }'); do
# export -f $i
#done

source $ZSH/oh-my-zsh.sh
