#!/bin/bash

. .shell_vars

if [ "$CURRENT_SHELL" = bash ]; then

if ! grep -Po "$LEAD" "$BASHRC" ; then
  printf "\n%s\n\n%s" "$LEAD" "$TAIL" >> "$BASHRC"
fi

sed -i "/$LEAD/,/$TAIL/ c\
$LEAD\
\n\n\
#. /usr/share/autojump/autojump.sh\
$DOTFILES\\
\n\
$TAIL
" "$BASHRC"

elif [ "$CURRENT_SHELL" = zsh ]; then

ln -sf "$DOT_LOC/.zshrc" "$ZSHRC"

fi

for file in "$DOT_LOC"/.{vimrc,tmux.conf}; do
ln -sf "$file" "/home/$USERNAME/"
done

if ! which git; then 
printf "\n\nvim requires git to install plugins!\n\n"
fi