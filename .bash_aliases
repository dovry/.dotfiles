# version 5.33.38
# X.0.0 major 		- the file is overhauled
# 0.X.0 minor		- commands are added or removed
# 0.0.X fix 		- the file is improved in any other way

### Variables
editor=vim

# tells you what versions of the files you currently have
alias ver='head -qn 1 ~/.vimrc ~/.tmux.conf ~/.bash_aliases'

# modify aliases
alias alconf='$editor ~/.bash_aliases'				# edit .bash_aliases
alias   rlal='source ~/.bashrc'					# source .bash.rc
alias   cpal='cp ~/.bash_aliases ~/.backup/.bash_alias.old'	# backup .bash_aliases
alias cprlal='cpal && rlal'					# copies .bash_aliases, then sources .bashrc

# modify tmux
alias tmconf='$editor ~/.tmux.conf'				# edit .tmux.conf
alias   rltm='tmux source-file ~/.tmux.conf'			# reload .tmux.conf
alias   cptm='cp ~/.tmux.conf ~/backup/.tmux.conf.old'		# backup .tmux.conf
alias cprltm='cptm && rltm'					# copies .tmux.conf, then sources it

# modify vim
alias   vimrc='$editor ~/.vimrc'				# edit .vimrc
alias vimconf='$editor ~/.vimrc'			# edits the .vimrc with your preferred editor
alias   vimcp='cp ~/.vimrc ~/.backup/.vimrc.old'		# creates a copy of the .vimrc file
alias   rlvim='echo | vim +"so %"  '			# sources .vimrc from shell

## Updates & Upgrades
alias       upd='sudo apt update'			# updates
alias       upg='sudo apt dist-upgrade -y'		# upgrades
alias     updog='upd && upg && newconf && ver'	# the whole shebang
alias   install='sudo apt install'		# type 'install' instead of 'sudo apt install'
alias uninstall='sudo apt remove'		# type 'uninstal' instead of 'sudo apt remove'
alias      aver='apt-cache madison'			# package version
alias        as='apt-cache search'			# package search
alias        ai='sudo apt install'			# another version of 'install'
alias        ar='sudo apt remove'			# another version of 'uninstall'
alias       aud='sudo apt update'			# another version of 'upd'
alias       aug='sudo apt upgrade'			# another version of 'upg'
alias        aa='sudo apt autoremove'			# cleans unused packages
alias        af='sudo apt install -f'			# fixes broken packages

## Tmux
alias ta='tmux attach -t'		# Attaches tmux to a session
alias tm='tmux new -s'			# Creates a new session
alias tl='tmux list-sessions'		# Lists all ongoing sessions
alias tk='tmux kill-session -t'		# kill specific session

## Utility
alias               c='clear'						# clears the terminal, ctrl+L works as well
alias               s='sudo'						# type 's' instead of 'sudo'
alias               h='history'					# shows you all the entries of the session
alias               v='vim'             				# runs vim
alias             rwx='stat -c %a'					# shows you the RWX rights on a file (rwx .bash_aliases should return 664)
alias          please='sudo $(history -p !!)'			# rerun last command as sudo
alias             ffs='sudo $(history -p !!)'			# rerun last command as sudo
alias            phug='tree -phug'					# Print filetype - Human readable size - Username - Groupname

# look up aliases
alias network-restart='sudo /etc/init.d/networking restart'
alias        flushdns='sudo systemd-resolve --flush-caches'
alias            vols='lvs -o +devices'				# lists volumes and where they're mounted
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com' # gets your public ip
alias   opo='sudo netstat -tulpn | grep LISTEN' 		# *OP*en *P*orts


# ls
alias    la='ls -lAh --block-size=M --file-type'	# list all the things
alias   lac='ls -laC --color'			# list things in columns

## Docker
alias   wd='watch docker ps'	  # live view of running docker containers
alias  dps='docker ps'		  # list of running docker containers
alias dcst='docker container stop' # stop container
alias dcrm='docker container rm'  # remove container
alias  dnp='docker network prune' # purges all unused networks
alias  dip='docker image prune -a' # purges all unused images
alias dspa='docker system prune -a' # purges all unused resources
alias dils='docker image ls'	  # list of images stored locally
alias dirm='docker image rm'	  # docker image remove

## Docker-compose
alias    dc='docker-compose'         # shortcut for docker-compose
alias   dcd='docker-compose down'   # brings down the environment gracefully
alias   dcu='docker-compose up -d'  # brings up the environment
alias   dcp='docker-compose pull'   # pulls all images listed in the docker-compose file
alias dcdpu='dcd && dcp && dcu'   # oneline for the previous three commands

## Vagrant
alias vup='vagrant up'		  # start vm from vagrant file
alias  vs='vagrant ssh'		  # ssh into the vagrant vm
alias vde='vagrant destroy'	  # destroy the vagrant vm

## Ansible
alias  ap='ansible-playbook'   # run playbooks
alias ave='ansible-vault edit' # modify vault-encrypted files
alias aver='ansible --version' # check ansible version
alias ams='ansible -m setup' # run facts-gathering on a target host

## Terraform
alias    tf='terraform'
alias   tfp='terraform plan'
alias   tfa='terraform apply'
alias   tfd='terraform destroy'
alias   tft='terraform taint'
alias  tfut='terraform untaint'
alias   tfi='terraform init'
alias   tfv='terraform validate'
alias tfver='terraform version'

## Git
alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gba='git branch --all'

alias gc='git commit'
alias gca='git commit --add'
alias gcam='git commit --add --message'
alias gcm='git commit --message'

alias gch='git checkout'
alias gchb='git checkout -b'
alias gchm='git checkout master'
alias gck='git checkout'

alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git difftool'

alias gp='git push'
alias gpl='git pull'
alias gpo='git push origin'
alias gpom='git push origin master'

alias grm='git rm'
alias grmr='git rm -r'