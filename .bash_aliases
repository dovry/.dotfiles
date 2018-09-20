# aliases v1.1.3
# X.0.0 means major version, where the whole file is changed
# 0.X.0 means a minor version, where a command is added/removed
# 0.0.X means a fix, where a command is moved or a command is expanded upon

#tells you what versions of the files you currently have
head -n 1 ~/.bash_aliases
head -n 1 ~/.tmux.conf
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

## update alias file to the latest version from @Dovry's GitHub
newalias () {
cd
mv ~/.bash_aliases ~/.bash_aliases.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases
source ~/.bashrc
}

## update tmux file to the lastest version from @Dovry's GitHub
newtmux () {
cd
mv ~/.tmux.conf ~/.tmux.conf.old
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf
tmux source ~/.tmux.conf
}


## Updates & Upgrades
alias upd='sudo apt update'				#updates
alias upg='sudo apt dist-upgrade -y'			#upgrades
alias updog='upd && upg && newalias && newtmux'		#the whole shebang
alias install='sudo apt install'			#type 'install' instead of 'sudo apt install'
alias uninstall='sudo apt remove'			#type 'uninstal' instead of 'sudo apt remove'

## Tmux
alias tm="tmux -2 attach-session || tmux -2 new-session -s" 	# Attaches tmux to the last session; creates a new session if none exists.
alias ta='tmux attach -t'					# Attaches tmux to a session (example: ta portal)
alias tn='tmux new -s'						# Creates a new session
alias tl='tmux list-sessions'					# Lists all ongoing sessions

## Utility 
alias c='clear'						#clears the terminal, ctrl+L works as well
alias s='sudo'						#type 's' instead of 'sudo'
alias h='history'					#shows you all the entries of the session
alias grep='grep --color=auto'				#makes grep show colors (should be default in most shells)
alias rwx='stat -c %a'					#shows you the RWX rights on a file (rwx .bash_aliases should return 664)
alias please='sudo $(history -p !!)'			#rerun last command as sudo
alias www='cd /var/www/'				#cd to /var/www/
alias html='cd /var/www/html'				#cd to /var/www/html

grope () {sudo touch "$1" && sudo $editor "$1"}		# (forcibly) touch file, then (forcibly) enter
mkcd () {mkdir "$1" && cd "$1"}				#create directory, then enter
cs () {cd $1 && ls -ah}					#change directory, then list everything within

#lists
alias la='ls -lAh --block-size=M --color --file-type'	#list all the things
alias ll='ls -l'					#list things in a list
alias lac='ls -laC --color'				#list things in columns

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


#play video without a web browser
stream () {
youtube-dl -o - "$1" | $video -
}

alias pubip='dig +short myip.opendns.com @resolver1.opendns.com'
