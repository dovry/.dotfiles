## These are my aliases, take a gander

### remember to add .bash_aliases to your .bashrc
### add .bash_aliases file
###    if [ -f ~/.bash_aliases ]; then
###    . ~/.bash_aliases
###    fi

#variables
$nano #text editor


## update alias file to newest from Dovry's GitHub
newalias () {
rm ~/.bash_aliases
wget https://raw.githubusercontent.com/Dovry/master/dotfiles/arch/.bash_aliases
source ~/.bashrc
}

## update, upgrade, install
alias install='sudo pacman -S'
alias instally='sudo yaourt'
alias updog='sudo pacman -Syu'

## Utility
alias c='clear'
alias s='sudo'
alias h='history'

#rerun last command as sudo
alias please='sudo $(history -p !!)'

#cd to /var/www/html, useful if you're dealing with webservers
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
