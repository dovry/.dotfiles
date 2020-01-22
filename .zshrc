# 2.0.0 - zshrc
# X.0.0 major 	- the file is overhauled
# 0.X.0 minor		- commands are added or removed
# 0.0.X fix 		- the file is improved in any other way

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zshrc location and source the dotfiles
Z_LOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $Z_LOC/.shell_vars
source $Z_LOC/.shell_aliases
source $Z_LOC/.shell_functions

editor="vim"
ZSH_THEME="wezm"
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
  git
  git-extras
  perms
  sudo
  tmux
  vagrant
  vscode
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# git clone https://github.com/pindexis/qfc $HOME/.config/.qfc
[[ -s "$HOME/.config/.qfc/bin/qfc.sh" ]] && source "$HOME/.config/.qfc/bin/qfc.sh"

qfc_quick_command 'cd' '\C-b' 'cd $0'
qfc_quick_command 'vim' '\C-p' 'vim $0'

# Export functions
for i in $(grep -Po "\w+ \(\)" ~/.dotfiles/.shell_functions | awk '{ print $1 }'); do
 export -f $i
done

source $ZSH/oh-my-zsh.sh