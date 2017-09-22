## These are my aliases, take a gander
##
#update alias file to newest from @Dovry's GitHub
newalias () {
rm ~/.bash_aliases
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases
source ~/.bash_rc
}

## update, upgrade, install, update+upgrade
alias upd='sudo apt update'
alias upg='sudo apt dist-upgrade -y'
alias install='sudo apt install'
alias updog='sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt autoremove' 

## Utility 
alias c='clear'
alias s='sudo'
alias h='history'
#alias ag='alias | grep' ## Can't get this to work for some reason, never returns anything

#rerun last command as sudo
alias please='sudo $(history -p !!)'

#cd to /var/www/html
alias html='cd /var/www/html'

#lists
alias la='ls -lah'
alias ll='ls -l'

#mod aliases
alias alises='aliases'
alias aliases='nano ~/.bash_aliases'
alias rlal='source ~/.bashrc'
alias cpal='cp ~/.bash_aliases bash_alias_old'
#copy alises, then reload bashrc
alias cprl='cpal;rlal'

#touch file, then enter
grope () {
	touch "$1"
	nano "$1"
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
