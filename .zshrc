# version 1.0.0
# X.0.0 major 		- the file is overhauled
# 0.X.0 minor		- commands are added or removed
# 0.0.X fix 		- the file is improved in any other way

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  ansible
  autojump
  command-not-found
  common-aliases
  copyfile
  dircycle
  dirhistory
  docker
  extract
  git
  git-extras
  kubectl
  perms
  sudo
  tmux
  vagrant
  vscode
  web-search
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

## Updates & Upgrades
alias       upd='sudo apt update'			#updates
alias       upg='sudo apt dist-upgrade -y'		#upgrades
alias     updog='upd && upg && newconf && ver'	#the whole shebang
alias   install='sudo apt install'		#type 'install' instead of 'sudo apt install'
alias uninstall='sudo apt remove'		#type 'uninstal' instead of 'sudo apt remove'
alias      aver='apt-cache madison'			# package version
alias        as='apt-cache search'			# package search
alias        ai='sudo apt install'			#another version of 'install'
alias        ar='sudo apt remove'			#another version of 'uninstall'
alias       aud='sudo apt update'			#another version of 'upd'
alias       aug='sudo apt upgrade'			#another version of 'upg'
alias        aa='sudo apt autoremove'			#cleans unused packages
alias        af='sudo apt install -f'			#fixes broken packages

## Utility 
alias               c='clear'						#clears the terminal, ctrl+L works as well
alias               s='sudo'						#type 's' instead of 'sudo'
alias               h='history'					#shows you all the entries of the session
alias               v='vim'             				#runs vim
alias             rwx='stat -c %a'					#shows you the RWX rights on a file (rwx .bash_aliases should return 664)
alias          please='sudo $(history -p !!)'			#rerun last command as sudo
alias             ffs='sudo $(history -p !!)'			#rerun last command as sudo
alias            phug='tree -phug'					#Print filetype - Human readable size - Username - Groupname
alias network-restart='sudo /etc/init.d/networking restart'
alias        flushdns='sudo systemd-resolve --flush-caches'
alias            vols='lvs -o +devices'				# lists volumes and where they're mounted
alias           pubip='dig +short myip.opendns.com @resolver1.opendns.com' # gets your public ip
alias             opo='sudo netstat -tulpn | grep LISTEN' 		# *OP*en *P*orts
alias              la='ls -lAh --block-size=M --file-type'	#list all the things
alias             lac='ls -laC --color'			#list things in columns
grope () { sudo touch "$1" && sudo $editor "$1"; }		# (forcibly) touch file, then (forcibly) edit
mkcd () { mkdir "$1" && cd "$1"; }				#create directory, then change to that dir
mpcd () { mkdir -p "$1" && cd "$1"; }			#create dir tree, then change to the deepest dir created

# cd up N directories - 'cd 3' goes up ../../../
function ..(){
    if [ -n "$1" ]; then
        NUM=$(grep -o '[0-9]\+' <<< "$1")
        START=0
        while [ "$START" -lt "$NUM" ]
        do
            \cd ..
            START=$((START+1))
        done
    else
        \cd ..
    fi
}

## Docker
alias   wd='watch docker ps'	  # live view of running docker containers
alias  dps='docker ps'		  # list of running docker containers
alias dcst='docker container stop' # stop container
alias dils='docker image ls'	  # list of images stored locally
alias dirm='docker image rm'	  # docker image remove
alias dcrm='docker container rm'  # remove container
dcstrm () { docker container stop "$1" && docker container rm "$1"; }

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