## These are my aliases, take a gander

## update, upgrade, install, update+upgrade
alias upd='sudo apt update'
alias upg='sudo apt dist-upgrade -y'
alias install='sudo apt install'
alias updog='sudo apt-get update && sudo apt-get dist-upgrade -y' 

## Utility 
alias c='clear'
alias s='sudo'
#rerun last command as sudo
alias fuck='sudo !!'
#cd to /var/www/html
alias html='cd /var/www/html'
#lists
alias la='ls -lah'
alias ll='ls -l'

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






