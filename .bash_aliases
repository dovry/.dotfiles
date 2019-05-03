# version 5.20.31
# X.0.0 major 		- the file is overhauled
# 0.X.0 minor		- commands are added or removed
# 0.0.X fix 		- the file is improved in any other way

### Variables
editor=vim

### Aliases and functions

## checks if .bash_aliases exists, if it does it updates and sources it.
## if it doesn't exist it gets the file from Dovry's GitHub 
## repo and sources it so it takes effect
newalias () {
if [ -f ~/.bash_aliases ]
then
	mv ~/.bash_aliases ~/.backup/.bash_aliases.old
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
else
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
	source ~/.bashrc
fi
}

## checks if .tmux.conf exists, if it does it updates and sources it. If it doesn't exist
## it gets the file from Dovry's GitHub repo and sources it so it takes effect
newtmux () {
if [[ -f ~/.tmux.conf ]] && [[ -d ~/.tmux/plugins/tpm ]]
then
	mv ~/.tmux.conf ~/.backup/.tmux.conf.old
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/update_plugins all
else
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/install_plugins
fi
}

## checks if .vimrc exists, if it does it updates and sources it. If it doesn't exist
## it gets the file that installs and configures it from Dovry's GitHub repo
newvim () {
if [[ -f ~/.vimrc ]]
then
	mv ~/.vimrc ~/.backup/.vimrc.old
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
else
	mkdir -p ~/.vim/autoload/
	wget -bqc --show-progress https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P ~/.vim/autoload/
        wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
fi
}

#moves old config files, and fetches new ones from GitHub
newconf () { newalias & newvim & newtmux & wait;}

#tells you what versions of the files you currently have
alias ver='grep -P "version \d+.\d+.\d+" ~/.vimrc ~/.tmux.conf ~/.bash_aliases'

#mod aliases
alias alconf='$editor ~/.bash_aliases'				#edit .bash_aliases
alias rlal='source ~/.bashrc'					#source .bash.rc
alias cpal='cp ~/.bash_aliases ~/.backup/.bash_alias.old'	#backup .bash_aliases
alias cprlal='cpal && rlal'					#copies .bash_aliases, then sources .bashrc

#mod tmux
alias tmconf='$editor ~/.tmux.conf'				#edit .tmux.conf
alias rltm='tmux source-file ~/.tmux.conf'			#reload .tmux.conf
alias cptm='cp ~/.tmux.conf ~/backup/.tmux.conf.old'		#backup .tmux.conf
alias cprltm='cptm && rltm'					#copies .tmux.conf, then sources it

#mod vim
alias vimrc='$editor ~/.vimrc'				#edit .vimrc
alias vimconf='$editor ~/.vimrc'			#edits the .vimrc with your preferred editor
alias vimcp='cp ~/.vimrc ~/.backup/.vimrc.old'		# creates a copy of the .vimrc file
alias rlvim='echo | vim +"so %"  '			# sources .vimrc from shell
cprlvim () { vimcp && echo | vim +"so %"; }		# backup .vimrc, then sources it

## Updates & Upgrades
alias upd='sudo apt update'			#updates
alias upg='sudo apt dist-upgrade -y'		#upgrades
alias updog='upd && upg && newconf && ver'	#the whole shebang
alias install='sudo apt install'		#type 'install' instead of 'sudo apt install'
alias uninstall='sudo apt remove'		#type 'uninstal' instead of 'sudo apt remove'
alias ai='sudo apt install'			#another version of 'install'
alias ar='sudo apt remove'			#another version of 'uninstall'
alias aud='sudo apt update'			#another version of 'upd'
alias aug='sudo apt upgrade'			#another version of 'upg'
alias aa='sudo apt autoremove'			#cleans unused packages
alias af='sudo apt install -f'			#fixes broken packages

## Tmux
alias ta='tmux attach -t'		# Attaches tmux to a session
alias tm='tmux new -s'			# Creates a new session
alias tl='tmux list-sessions'		# Lists all ongoing sessions
alias tk='tmux kill-session -t'		# kill specific session

## Utility 
alias c='clear'						#clears the terminal, ctrl+L works as well
alias s='sudo'						#type 's' instead of 'sudo'
alias h='history'					#shows you all the entries of the session
alias v='vim'             				#runs vim
alias rwx='stat -c %a'					#shows you the RWX rights on a file (rwx .bash_aliases should return 664)
alias please='sudo $(history -p !!)'			#rerun last command as sudo
alias ffs='sudo $(history -p !!)'			#rerun last command as sudo
alias phug='tree -phug'					#Print filetype - Human readable size - Username - Groupname
alias network-restart='sudo /etc/init.d/networking restart'
alias flushdns='sudo systemd-resolve --flush-caches'
alias vols='lvs -o +devices'				# lists volumes and where they're mounted
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com' # gets your public ip
alias opo='sudo netstat -tulpn | grep LISTEN' 		# *OP*en *P*orts
alias la='ls -lAh --block-size=M --file-type'	#list all the things
alias lac='ls -laC --color'			#list things in columns
grope () { sudo touch "$1" && sudo $editor "$1"; }		# (forcibly) touch file, then (forcibly) edit
mkcd () { mkdir "$1" && cd "$1"; }				#create directory, then change to that dir
mpcd () { mkdir -p "$1" && cd "$1"; }			#create dir tree, then change to the deepest dir created

## Docker
alias wd='watch docker ps'	  # live view of running docker containers
alias dps='docker ps'		  # list of running docker containers
alias dcst='docker container stop'# stop container
alias dcrm='docker container rm'  # remove container
dcstrm () {docker container stop "$1" && docker container rm "$1";}
alias dils='docker image ls'	  # list of images stored locally
alias dirm='docker image rm'	  # docker image remove

## Docker-compose
alias dc='docker-compose'         # shortcut for docker-compose
alias dcd='docker-compose down'   # brings down the environment gracefully
alias dcu='docker-compose up -d'  # brings up the environment
alias dcp='docker-compose pull'   # pulls all images listed in the docker-compose file
alias dcdpu='dcd && dcp && dcu'   # oneline for the previous three commands

## Vagrant
alias vup='vagrant up'		  # start vm from vagrant file
alias vs='vagrant ssh'		  # ssh into the vagrant vm
alias vde='vagrant destroy'	  # destroy the vagrant vm
