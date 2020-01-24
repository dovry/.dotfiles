#!/bin/bash

. .shell_vars

# Check which shell, then run config
if [ "$CURRENT_SHELL" = bash ]; then
# For bash - edit ~/.bashrc to source the aliases
  if grep -qo "$LEAD" "$BASHRC"; then
    :
    else
    printf "\n%s\n\n%s" "$LEAD" "$TAIL" >> "$BASHRC"
  fi

  # Make folder colors readable on WSL
  if grep -qP "WSL" ~/.bashrc || grep -qP "(Microsoft|WSL)" /proc/version; then
    WSL_DIR_COL="  LS_COLORS=\"ow=01;36;40\" && export LS_COLORS #WSL dir colors\n"
    else
    WSL_DIR_COL=""
  fi

  if [ ! "$(which autojump)" ]; then
    AUTOJUMP=""
    else
    AUTOJUMP=". /usr/share/autojump/autojump.sh"
  fi

  if [ -f "$HOME/.qfc/README.md" ]; then
    QFC="\
    [[ -s \"$HOME/.config/.qfc/bin/qfc.sh\" ]] && source \"$HOME/.config/.qfc/bin/qfc.sh\"\n"
    else
    QFC=
  fi

sed -i "/$LEAD/,/$TAIL/ c\
$LEAD\\
\n\
$WSL_DIR_COL\
$AUTOJUMP\
$QFC\
$DOTFILES\
\n\
$PS1\
\n\
$TAIL" "$BASHRC"

elif [ "$CURRENT_SHELL" = zsh ]; then
  ln -sf "$DOT_LOC/.zshrc" "$ZSHRC"
elif [ ! "$CURRENT_SHELL" = zsh ] || [ ! "$CURRENT_SHELL" = bash ]; then
  printf "\nCurrent shell is %s\nAliases and functions only work with %s\n\n" "$CURRENT_SHELL" "$SUPPORTED_SHELLS"
fi

# Link files to ~/ for bash - link to ~/.dotfiles/ for zsh
for file in "$DOT_LOC"/.{vimrc,tmux.conf}; do
ln -sf "$file" "/home/$USERNAME/"
done

if [ ! "$(which git)" ] || [ ! "$(which curl)" ]; then 
printf "\n\nvim requires git and curl to install plugins!\n\n"
fi