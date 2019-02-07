# version 5.16.31
# X.0.0 major 		- the file is overhauled
# 0.X.0 minor		- commands are added or removed
# 0.0.X fix 		- the file is improved in any other way

### Variables
editor=vim

### Aliases and functions

## checks if .bash_aliases exists, if it does it updates and sources it.
## if it doesn't exist it gets the file from Dovry's GitHub 
## repo and sources it so it takes effect
newalias () {
if [ -f ~/.bash_aliases ]
then
	mv ~/.bash_aliases ~/.backup/.bash_aliases.old
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
else
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.bash_aliases -P ~/
	source ~/.bashrc
fi
}

## checks if .tmux.conf exists, if it does it updates and sources it. If it doesn't exist
## it gets the file from Dovry's GitHub repo and sources it so it takes effect
newtmux () {
if [[ -f ~/.tmux.conf ]] && [[ -d ~/.tmux/plugins/tpm ]]
then
	mv ~/.tmux.conf ~/.backup/.tmux.conf.old
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/update_plugins all
else
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.tmux.conf -P ~/
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/install_plugins
fi
}

## checks if .vimrc exists, if it does it updates and sources it. If it doesn't exist
## it gets the file that installs and configures it from Dovry's GitHub repo
newvim () {
if [[ -f ~/.vimrc ]]
then
	mv ~/.vimrc ~/.backup/.vimrc.old
	wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
else
	mkdir -p ~/.vim/autoload/
	wget -bqc --show-progress https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P ~/.vim/autoload/
        wget -bqc --show-progress https://raw.githubusercontent.com/Dovry/dotfiles/master/.vimrc -P ~/
