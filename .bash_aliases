# version 5.11.18
# X.0.0 major	 	- the file is overhauled
# 0.X.0 minor		- commands are added or removed
# 0.0.X fix 		- the file is improved in any other way

### Variables
editor=vim

### Aliases and functions

## checks if .bash_aliases exists, if it does it updates and sources it if it doesn't exist,
## it gets the file from Dovry's GitHub repo and sources it so it takes effect
newalias () {
if [ -e ~/.bash_aliases ]
then
	mv ~/.bash_aliases ~/.backup/.bash_aliases.old
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
else
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
	source ~/.bashrc
	clear
fi
}

## checks if .tmux.conf exists, if it does it updates and sources it. If it doesn't exist,
## it gets the file from Dovry's GitHub repo and sources it so it takes effect
newtmux () {
if [ -e ~/.tmux.conf ]
then
	mv ~/.tmux.conf ~/.backup/.tmux.conf.old
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	tmux source ~/.tmux.conf
else
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	tmux source ~/.tmux.conf
	clear
fi
}

## checks if .vimrc exists, if it does it updates and sources it. If it doesn't exist
##it gets the file that installs and configures it from Dovry's GitHub repo
newvim () {
if [[ -e ~/.vimrc && ~/.vim/colors ]]
then
	mv ~/.vimrc ~/.backup/.vimrc.old
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
	echo | vim +"so %"
else
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/config-install/vim-install.sh -P ~/
	chmod +x ~/vim-install.sh && sh ~/vim-install.sh && rm ~/vim-install.sh
	clear
fi
}

#moves old config files, and fetches new ones from GitHub
newconf () {
    newvim
    newtmux
    newalias
}

#tells you what versions of the files you currently have
alias ver='head -n 1 ~/.bash_aliases ~/.tmux.co ~/.vimrc'

#mod aliases
alias alconf='$editor ~/.bash_aliases'			#edit .bash_aliases
alias rlal='source ~/.bashrc'				#source .bash.rc
alias cpal='cp ~/.bash_aliases ~/.bash_alias.old'	#backup .bash_aliases
alias cprlal='cpal && rlal'				#copies .bash_aliases, then sources .bashrc

#mod tmux
alias tmconf='$editor ~/.tmux.conf'			#edit .tmux.conf
alias rltm='tmux source ~/.tmux.conf'			#reload .tmux.conf
alias cptm='cp ~/.tmux.conf ~/.tmux.conf.old'		#backup .tmux.conf
alias cprltm='cptm && rltm'				#copies .tmux.conf, then sources it

#mod vim
alias vimrc='$editor ~/.vimrc'				#edit .vimrc
alias vimconf='$editor ~/.vimrc'			#edits the .vimrc with your preferred editor
alias vimcp='cp ~/.vimrc ~/.vimrc.old'			# creates a copy of the .vimrc file
alias rlvim='echo | vim +"so %"  '			# sources .vimrc from shell
# backup .vimrc, then sources it
cprlvim () {
vimcp
echo | vim +"so %"
}

## Updates & Upgrades
alias upd='sudo apt update'		#updates
alias upg='sudo apt dist-upgrade -y'	#upgrades
alias updog='upd && upg && newconf'	#the whole shebang
alias install='sudo apt install'	#type 'install' instead of 'sudo apt install'
alias uninstall='sudo apt remove'	#type 'uninstal' instead of 'sudo apt remove'
alias ai='sudo apt install'		#another version of 'install'
alias ar='sudo apt remove'		#another version of 'uninstall'
alias aud='sudo apt update'		#another version of 'upd'
alias aug='sudo apt upgrade'		#another version of 'upg'
alias aa='sudo apt autoremove'		#cleans unused packages
alias af='sudo apt install -f'		#fixes broken packages

## Tmux
alias ta='tmux attach -t'		# Attaches tmux to a session
alias tm='tmux new -s'			# Creates a new session
alias tl='tmux list-sessions'		# Lists all ongoing sessions

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
alias vols='lvs -o +devices'				# lists volumes and where they're mounted
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com' # gets your public ip
alias opo='sudo netstat -tulpn | grep LISTEN' 		# *OP*en *P*orts
alias la='ls -lAh --block-size=M --file-type'	#list all the things
alias lac='ls -laC --color'			#list things in columns

# (forcibly) touch file, then (forcibly) enter
grope () {
sudo touch "$1"
sudo $editor "$1"
}

#create directory, then change to that dir
mkcd () {
mkdir "$1" 
cd "$1"
}

#create dir tree, then change to the deepest dir created
mpcd () {
mkdir -p "$1" 
cd "$1"
}
