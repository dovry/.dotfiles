## These are my aliases, take a gander

### remember to add .bash_aliases to your .bashrc
### add .bash_aliases file
###    if [ -f ~/.bash_aliases ]; then
###    . ~/.bash_aliases
###    fi

#variables
editor=nano #text editor
video=vlc #video media
#player= #audio media


## update alias file to newest from Dovry's GitHub
newalias () {
mv ~/.bash_aliases ~/.bash_aliases.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/arch/.bash_aliases
source ~/.bashrc
}

## update, upgrade, install
alias install='sudo pacman -S'
alias aur='yaourt'
alias updog='sudo pacman -Syu'

## Utility
alias c='clear'
alias s='sudo'
alias h='history'
alias grep='grep --color=auto'

#rerun last command as sudo
alias please='sudo $(history -p !!)'

#cd to /var/www/html, useful if you're working with webservers
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

#create file, then edit with sudo (its faster to type, ok?)
alias grope='sudo $editor "$1"'

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
