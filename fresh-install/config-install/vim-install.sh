#! /bin/bash

wget https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
wget https://raw.githubusercontent.com/Dovry/dotfiles/master/fresh-install/vim-themes.txt -P ~/.vim/colors
wget -i ~/.vim/colors/vim-themes.txt -P ~/.vim/colors/
rm ~/.vim/colors/vim-themes.txt
echo | vim +PluginInstall +qall
wget https://raw.githubusercontent.com/cocopon/iceberg.vim/master/autoload/lightline/colorscheme/iceberg.vim -P ~/.vim/bundle/lightline.vim/autoload/lightline/colorscheme
