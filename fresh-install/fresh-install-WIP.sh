#!/bin/bash
set -e

# Sets the username for the main user of the computer, used for defining the home folder
username=$(getent passwd | grep 1000 | cut -d : -f 1)

# gets .bash_aliases and puts it in the home directory
# This uses wget because curl is not installed by default on Ubuntu desktops
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P /home/$username
# sets the ps1 config and reloads the .bashrc for everything to take effect
crazyvariablenobodycouldeveruse=$(wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/ps1 -q -O -)
echo $crazyvariablenobodycouldeveruse >> /home/$username/.bashrc

# runs a full update & upgrade on the system
sudo apt -y update
sudo apt -y upgrade

# starts installing packages
sudo apt install -y avahi-daemon tmux vim \
tree htop git curl net-tools

# removes junk, most of this is not installed with the minimal version of ubuntu
sudo apt remove -y --purge libreoffice* aisleriot* gnome-mines* gnome-sudoku thunderbird*
sudo apt remove -y ubuntu-web-launchers rhythmbox cheese 

# clean up unused package dependencies
sudo apt autoremove -y

# fetches config files for tmux
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P /home/$username/
git clone https://github.com/tmux-plugins/tpm /home/$username/.tmux/plugins/tpm
tmux source-file /home/$username/.tmux.conf

# fetches Vim config
mkdir -p ~/.vim/autoload/
	wget -bqc --show-progress https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P ~/.vim/autoload/
        wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/

# Clean up the homefolder
rmdir /home/$username/{Music,Public,Templates,Videos,Desktop}
mkdir /home/$username/.backups
chown -R $username:$username /home/$username/*

# tells user to source .bashrc
source /home/$username/.bashrc

# release the variables back into the wild
unset crazyvariablenobodycouldeveruse #ironic
unset username

clear && echo "enjoy your desktop"
