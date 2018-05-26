## These are my aliases, take a gander

### remember to add .bash_aliases to your .bashrc
### add .bash_aliases file
###    if [ -f ~/.bash_aliases ]; then
###    . ~/.bash_aliases
###    fi

## last line in .bashrc for neat colors
# export PS1="\[\033[38;5;160m\]>_\[$(tput sgr0)\]\[\033[38;5;15m\] \w\n\[$(tputsgr0)\]\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;160m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \\\\ \[$(tputsgr0)\]\[\033[38;5;160m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]"

#variables
editor=nano #text editor
video=vlc #video media
#player= #audio media

# WSL GitHub directory
alias cdgh='cd /mnt/c/Users/Dovry/Documents/GitHub'

## update alias file to newest from @Dovry's GitHub
newalias () {
mv ~/.bash_aliases ~/.bash_aliases.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases
source ~/.bashrc
}

## update, upgrade, install, update+upgrade
alias upd='sudo apt update'
alias upg='sudo apt dist-upgrade -y'
alias install='sudo apt install'
alias updog='sudo apt-get update && sudo apt-get dist-upgrade -y && cd && mv ~/.bash_aliases ~/.bash_aliases.old && wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases && source ~/.bashrc' 

## Utility 
alias c='clear'
alias s='sudo'
alias h='history'
alias grep='grep --color=auto'
alias rwx='stat -c %a'

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
alias cprl='cpal;rlal'					#copy alises, then reload bashrc


#touch file, then enter
grope () {
	touch "$1"
	$editor "$1"
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
