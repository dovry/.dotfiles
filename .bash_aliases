# version 3.7.15
# X.0.0 means major version, where the major portion is changed
# 0.X.0 means a minor version, where a command is added/removed
# 0.0.X means a fix, where a command is moved, or the file is improved in any way

#tells you what versions of the files you currently have
head -n 1 ~/.bash_aliases ~/.tmux.conf ~/.vimrc
## These are my aliases, take a gander

#variables
editor=vim #text editor
video=vlc #video media
#player= #audio media


## checks if .bash_aliases exists, if it does it updates and sources it
## if it doesn't exist, it gets the file from Dovry's GitHub repo
## and sources it so it takes effect
if [ -e ~/.bash_aliases ]
then
	mv ~/.bash_aliases ~/.bash_aliases.old
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
else
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
	source ~/.bashrc
fi

## checks if .tmux.conf exists, if it does it updates and sources it
## if it doesn't exist, it gets the file from Dovry's GitHub repo
## and sources it so it takes effect
if [ -e ~/.tmux.conf ]
then
	mv ~/.tmux.conf ~/.tmux.conf.old
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	tmux source ~/.tmux.conf
else
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
	tmux source ~/.tmux.conf
fi

## checks if .vimrc exists, if it does it updates and sources it
## if it doesn't exist, it gets the file from Dovry's GitHub repo
## and sources it so it takes effect
## since Vim can utilise plugins, it requires a bunch more than just
## getting the file and sourcing it.
if [[ -e ~/.vimrc && ~/.vim/colors ]]
then
	mv ~/.vimrc ~/.vimrc.old
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
	echo | vim +"so %"
else
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	mkdir ~/.vim/colors
	wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/vim-themes.txt -P ~/.vim/colors
	wget -i ~/.vim/colors/vim-themes.txt -P ~/.vim/colors/
	rm ~/.vim/colors/vim-themes.txt
	echo | vim +PluginInstall +qall
fi

## Updates & Upgrades
alias upd='sudo apt update'				                #updates
alias upg='sudo apt dist-upgrade -y'			        #upgrades
alias newconf='newvim && newalias && newtmux'     #moves old config files, and fetches new ones from GitHub
alias updog='upd && upg && newconf'           		#the whole shebang
alias install='sudo apt install'			            #type 'install' instead of 'sudo apt install'
alias uninstall='sudo apt remove'			            #type 'uninstal' instead of 'sudo apt remove'
alias ai='sudo apt install'                       #another version of 'install'
alias ar='sudo apt remove'                        #another version of 'uninstall'
alias aud='sudo apt update'			                  #another version of 'upd'
alias aug='sudo apt upgrade'		                  #another version of 'upg'
alias aa='sudo apt autoremove'		                #cleans unused packages
alias af='sudo apt install -f'		                #fixes broken packages

## Tmux
alias ta='tmux attach -t'					# Attaches tmux to a session (example: ta portal)
alias tm='tmux new -s'						# Creates a new session
alias tl='tmux list-sessions'					# Lists all ongoing sessions

# Docker
alias docc='docker container'   #
alias docv='docker volume'   #
alias dprune='docker system prune'   #

## Utility 
alias c='clear'						#clears the terminal, ctrl+L works as well
alias s='sudo'						#type 's' instead of 'sudo'
alias h='history'					#shows you all the entries of the session
alias v='vim'             #runs vim
alias grep='grep --color=auto'				#makes grep show colors (should be default in most shells)
alias rwx='stat -c %a'					#shows you the RWX rights on a file (rwx .bash_aliases should return 664)
alias please='sudo $(history -p !!)'			#rerun last command as sudo
alias www='cd /var/www/'				#cd to /var/www/
alias html='cd /var/www/html'				#cd to /var/www/html
alias phug='tree -phug'
alias network-restart='sudo /etc/init.d/networking restart'

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

#lists
alias la='ls -lAh --block-size=M --file-type'	#list all the things
alias ll='ls -l'					#list things in a list
alias lac='ls -laC --color'				#list things in columns

#mod aliases
alias alises='aliases'  				                  #spelling error	for command below
alias aliases='$editor ~/.bash_aliases'			      #edit the .bash_aliases file
alias rlal='source ~/.bashrc'				              #source the .bash.rc file
alias cpal='cp ~/.bash_aliases ~/.bash_alias.old'	#backup the .bash_aliases file
alias cprlal='cpal && rlal'				                #copies alises, then reloads bashrc

#mod tmux
alias tmconf='$editor ~/.tmux.conf'			#edit the .tmux.conf file
alias rltm='tmux source ~/.tmux.conf'			#reload the .tmux.conf file
alias cptm='cp ~/.tmux.conf ~/.tmux.conf.old'		#creates a copy of the .tmux.conf file
alias cprltm='cptm && rltm'				#copies tmux conf, then reloads it

#mod vim
alias vimrc='$editor ~/.vimrc'      #edits the .vimrc with your preferred editor
alias vimconf='$editor ~/.vimrc'      #edits the .vimrc with your preferred editor
alias vip='cd ~/.vim/'      #goes to the vim folder
alias vimcp='cp ~/.vimrc ~/.vimrc.old' # creates a copy of the .vimrc file
alias rlvim='echo | vim +"so %"  ' # sources .vimrc
# copies .vimrc, then sources it
cprlvim () {
vimcp
echo | vim +"so %"
}

#play video without a web browser, requires youtube-dl to be installed
stream () {
youtube-dl -o - "$1" | $video -
}

alias pubip='dig +short myip.opendns.com @resolver1.opendns.com' # gets your public ip

# *OP*en *P*orts
alias opo='sudo netstat -tulpn | grep LISTEN' 
