#!/bin/bash
set -e

# gets .bash_aliases and puts it in the home directory
# This uses wget because curl is not installed by default on Ubuntu desktops
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/.
# sets the ps1 config and reloads the .bashrc for everything to take effect
crazyvariablenobodycouldeveruse=$(wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/ps1 -q -O -)
echo $crazyvariablenobodycouldeveruse >> ~/.bashrc

# runs a full update & upgrade on the system
sudo apt update -y
sudo apt upgrade

# starts installing packages
sudo apt install -y avahi-daemon tmux vim \
tree htop git curl

# removes junk, most of this is not installed with the minimal version
sudo apt remove -y --purge libreoffice* aisleriot* gnome-mines* gnome-sudoku
sudo apt remove -y ubuntu-web-launchers rhythmbox cheese 

# clean up unused package dependencies
sudo apt autoremove -y

# fetches config files for tmux
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf

# fetches Vim config
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/config-install/vim-install.sh -P ~/
chmod +x ~/vim-install.sh && sh ~/vim-install.sh && rm ~/vim-install.sh

# Clean up the homefolder
rmdir ~/{Music,Public,Templates,Videos,Desktop}
mkdir .backups

# release the variables back into the wild
unset crazyvariablenobodycouldeveruse #ironic

# tells user to source .bashrc
echo "Source your .bashrc with 'source .bashrc' to complete the setup"
