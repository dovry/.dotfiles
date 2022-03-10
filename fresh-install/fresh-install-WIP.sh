#!/bin/bash
username="$(whoami)"

# runs a full update & upgrade on the system
sudo apt-get -qq update
sudo apt-get -y dist-upgrade

# install packages
sudo apt-get install -y vim tmux autojump tree htop git curl net-tools bsdmainutils

# removes junk, most of this is not installed with the minimal version of ubuntu
sudo apt-get remove -y --purge *libreoffice* *aisleriot* *gnome-mines* *gnome-sudoku *thunderbird*
sudo apt-get remove -y ubuntu-web-launchers rhythmbox cheese

# clean up unused package dependencies
sudo apt-get -y autoremove

# Clean up the homefolder
rm -rf /home/"$username"/{Music,Public,Templates,Videos,Desktop}

# fetch tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
