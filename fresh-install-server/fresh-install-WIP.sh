#!/bin/bash
set -e

# Sets the username for the main user of the computer, used for defining the home folder
username=$(getent passwd | grep 1000 | cut -d : -f 1)

# gets .bash_aliases and puts it in the home directory
# This uses wget because curl is not installed by default on Ubuntu
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

# installs netdata, a monitoring tool
# https://github.com/netdata/netdata#how-it-looks
# the dashboard is accessed @ 
# http://<server_ip>:19999
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# removes junk, most of this is not installed with the minimal version of ubuntu (none of this shit is on servers)
#sudo apt remove -y --purge libreoffice* aisleriot* gnome-mines* gnome-sudoku thunderbird*
#sudo apt remove -y ubuntu-web-launchers rhythmbox cheese 

# clean up unused package dependencies
sudo apt autoremove -y

# fetches config files for tmux
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P /home/$username/
git clone https://github.com/tmux-plugins/tpm /home/$username/.tmux/plugins/tpm
tmux source-file /home/$username/.tmux.conf

# fetches Vim config
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/config-install/vim-install.sh -P /home/$username
chmod +x /home/$username/vim-install.sh && sh /home/$username/vim-install.sh && rm /home/$username/vim-install.sh

# Clean up the homefolder
#rmdir /home/$username/{Music,Public,Templates,Videos,Desktop}
mkdir /home/$username/.backups
chown -R $username:$username /home/$username/*

# release the variables back into the wild
unset crazyvariablenobodycouldeveruse #ironic
unset username
