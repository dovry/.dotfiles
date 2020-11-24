#!/bin/bash
set -e
username="$(whoami)"
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P /home/$username


# runs a full update & upgrade on the system
sudo apt-get -qq update
sudo apt-get -y dist-upgrade

# install packages
sudo apt-get install -y\ 
avahi-daemon\ 
tmux vim\ 
tree htop\ 
git curl\ 
net-tools\ 
bsdmainutils\ 
autojump


# removes junk, most of this is not installed with the minimal version of ubuntu
sudo apt-get remove -y --purge libreoffice* aisleriot* gnome-mines* gnome-sudoku thunderbird*
sudo apt-get remove -y ubuntu-web-launchers rhythmbox cheese

# clean up unused package dependencies
sudo apt-get autoremove -y


# Clean up the homefolder
rmdir /home/$username/{Music,Public,Templates,Videos,Desktop}
