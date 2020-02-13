#!/bin/bash

. .shell_vars

# Check which shell, then run config
if [[ "$CURRENT_SHELL" = zsh || "$CURRENT_SHELL" = bash ]]; then
  if grep -qo "$LEAD" "$RC"; then
    :
  else
    if [[ -f ~/.zshrc.orig ]]; then
      :
    else
      cp ~/.zshrc ~/.zshrc.orig
      printf "${ZSH_VER}\n# your original file was backed up to ~/.zshrc.orig" > ~/.zshrc
    fi
    printf "\n\n\n%s\n\n%s" "$LEAD" "$TAIL" >> "$RC"
  fi

# clear ZSH_SOURCE var if zsh is not the shell
  if [[ "$CURRENT_SHELL" == bash ]]; then
    ZSH_SOURCE=
  fi

  # Make folder colors readable on WSL
  if grep -qP "WSL" "$RC" || grep -qP "(Microsoft|WSL)" /proc/version; then
    WSL_DIR_COL="  LS_COLORS=\"ow=01;36;40\" && export LS_COLORS #WSL dir colors\n"
  else
    WSL_DIR_COL=""
  fi

  if [ -f /usr/share/autojump/autojump.sh ]; then
    AUTOJUMP=". /usr/share/autojump/autojump.sh"
    else
    AUTOJUMP=
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
\n\
$QFC\
$DOTFILES\
\n\
$WHAT\
\n\
$PS1\
\n\
$ZSH_RC\
\n\
$ZSH_SOURCE\
\n\n\
$TAIL" "$RC"

else
  printf "\nCurrent shell is %s\nAliases and functions only work with %s\n\n" "$CURRENT_SHELL" "$SUPPORTED_SHELLS"
fi

# Link files to ~/ for bash - link to ~/.dotfiles/ for zsh
for file in "$DOT_LOC"/.{vimrc,tmux.conf}; do
ln -sf "$file" "/home/$USERNAME/"
done

if [[ ! "$(which git)" || ! "$(which curl)" ]]; then 
printf "\n\nvim requires git and curl to install plugins!\n\n"
fi