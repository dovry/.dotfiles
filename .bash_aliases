echo "v0.0.0"
## These are my aliases, take a gander

### remember to add .bash_aliases to your .bashrc
### add .bash_aliases file
###    if [ -f ~/.bash_aliases ]; then
###    . ~/.bash_aliases
###    fi

## last line in .bashrc for neat colors
#export PS1=">_\[$(tput sgr0)\]\[\033[38;5;1m\] \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;49m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;85m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \\ \\$:\[$(tput sgr0)\]"

#variables
editor=nano #text editor
video=vlc #video media
#player= #audio media

## update alias file to newest from @Dovry's GitHub
newalias () {
cd
mv ~/.bash_aliases ~/.bash_aliases.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases
source ~/.bashrc
}

## update alias file to newest from @Dovry's GitHub
newtmux () {
cd
mv ~/.tmux.conf ~/.tmux.conf.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf
tmux source ~/.tmux.conf
}


## update, upgrade, (un)install, update+upgrade
alias upd='sudo apt update'
alias upg='sudo apt dist-upgrade -y'
alias updog='sudo apt-get update && sudo apt-get dist-upgrade -y && cd && mv ~/.bash_aliases ~/.bash_aliases.old && wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases && source ~/.bashrc'
alias install='sudo apt install'
alias uninstall='sudo apt remove'


## Tmux

# Attaches tmux to the last session; creates a new session if none exists.
alias tm="tmux -2 attach-session || tmux -2 new-session -s"

# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'

# Creates a new session
alias tn='tmux new -s'

# Lists all ongoing sessions
alias tl='tmux list-sessions'


## Utility 
alias c='clear'
alias s='sudo'
alias h='history'
alias grep='grep --color=auto'
alias rwx='stat -c %a'

# write amount of seconds before restart, if you don't it defaults to 60 seconds
# example: 'restart 5' restarts the machine in 5 seconds
alias restart='sudo shutdown -r -h'

#rerun last command as sudo
alias please='sudo $(history -p !!)'

#cd to /var/www/
alias www='cd /var/www/'
#cd to /var/www/html
alias html='cd /var/www/html'

#lists
alias la='ls -lah'
alias ll='ls -l'

#mod aliases
alias alises='aliases'  				#spelling error	for command below
alias aliases='$editor ~/.bash_aliases'			#edit the .bash_aliases file
alias rlal='source ~/.bashrc'				#source the .bash.rc file
alias cpal='cp ~/.bash_aliases ~/.bash_alias.old'	#backup the .bash_aliases file
alias cprlal='cpal && rlal'				#copies alises, then reloads bashrc

#mod tmux
alias tmconf='$editor ~/.tmux.conf'			#edit the .tmux.conf file
alias rltm='tmux source ~/.tmux.conf'			#reload the .tmux.conf file
alias cptm='cp ~/.tmux.conf ~/.tmux.conf.old'		#creates a copy of the .tmux.conf file
alias cprltm='cptm && rltm'				#copies tmux conf, then reloads it


# (forcibly) touch file, then (forcibly) enter
grope () {
	sudo touch "$1"
	sudo $editor "$1"
}

#create directory, then enter
mkcd () {
	mkdir "$1"
	cd "$1"
}

#change directory, then list everything within
cs () {
	cd $1
	ls -ah
}


#play video without a webbrowser
stream () {
youtube-dl -o - "$1" | $video -
}

alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
