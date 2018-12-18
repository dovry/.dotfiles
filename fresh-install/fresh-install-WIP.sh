#!/bin/bash
set -e

# gets my .bash_aliases file and puts it in the home directory
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/.
# sets the ps1 config and reloads the .bashrc for everything to take effect
crazyvariablenobodycouldeveruse=$(wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/ps1 -q -O -)
echo $crazyvariablenobodycouldeveruse >> ~/.bashrc
source ~/.bashrc

# requires the .bash_aliases file, runs a full update & upgrade on the system, and fetches the latest dotfiles.
updog
# starts installing packages
install -y avahi-daemon tmux vim \
	 rxvt-unicode tree htop git \
	 curl

# fetches vim colorschemes, puts them in the correct folder, then removes the theme file
# This is required by ~/.vimrc
# requires package 'git' to work
mkdir ~/.vim/colors
wget -P ~/. https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/vim-themes.txt
wget -P ~/.vim/colors/ -i vim-themes.txt
rm ~/.vim-themes.txt


# release the variables back into the wild
unset crazyvariablenobodycouldeveruse #ironic
