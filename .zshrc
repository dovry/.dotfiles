
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/dovre/.oh-my-zsh

#ZSH_THEME="mh"
#ZSH_THEME="agnoster"
#ZSH_THEME="avit"
#ZSH_THEME="blinks"
#ZSH_THEME="evan"
#ZSH_THEME="gallifrey"
#ZSH_THEME="imajes"
#ZSH_THEME="kardan"
#ZSH_THEME="kolo"
ZSH_THEME="norm"
#ZSH_THEME="sammy"
#ZSH_THEME="theunraveler"


HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git compleat common-aliases debian dircycle dirhistory sublime web-search colorized-man-pages colorize extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Custom Aliases


#variables
editor=nano #text editor
video=vlc #video media
#player= #audio media


## update alias file to newest from @Dovry's GitHub
newalias () {
mv ~/.zshrc ~/.zshrc.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.zshrc
source ~/.zshrc
}

#mod aliases
alias alises='aliases'  				#spelling error	for command below
alias aliases='$editor ~/.zshrc'			#edit the .zshrc file
alias rlal='source ~/.zshrc'				#source the .zshrc file
alias cpal='cp ~/.zshrc ~/.zshrc.new'			#backup the .zshrc file
alias cprl='cpal;rlal'	

#update, upgrade, install, update+upgrade+renew alias file
#alias upd='sudo apt update'
#alias upg='sudo apt dist-upgrade -y'
#alias install='sudo apt install'
#alias updog='sudo apt-get update && sudo apt-get dist-upgrade -y && mv ~/.zshrc ~/.zshrcold && wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.zshrc && source ~/.zshrc' 

## Utility 
alias c='clear'
alias s='sudo'
alias grep='grep --color=auto'

#rerun last command as sudo
alias please='sudo $(history -p !!)'

#create directory, then enter
mkcd () {
	mkdir "$1"
	cd "$1"
}

alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'

#plugin hotkeys
function options() {
    PLUGIN_PATH="$HOME/.oh-my-zsh/plugins/"
    for plugin in $plugins; do
        echo "\n\nPlugin: $plugin"; grep -r "^function \w*" $PLUGIN_PATH$plugin | awk '{print $2}' | sed 's/()//'| tr '\n' ', '; grep -r "^alias" $PLUGIN_PATH$plugin | awk '{print $2}' | sed 's/=.*//' |  tr '\n' ', '
    done
}
