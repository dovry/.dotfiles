#!/bin/bash

. $DOT_LOC/.shell_vars

# Check which shell, then run config
if [[ "$CURRENT_SHELL" = zsh || "$CURRENT_SHELL" = bash ]]; then
  # look for 'managed by dotfiles' marker, if present, ignore, if not, backup file and run script
  if grep -qo "$LEAD" "$RC"; then
    :
  else
    if [[ -f ~/.zshrc && ! -f ~/.zshrc.bak ]]; then
      cp ~/.{zshrc,zshrc.bak}
      printf "%s\n# your original file was backed up to ~/.zshrc.bak" "${ZSH_VER}" > ~/.zshrc
    else
      :
    fi
    printf "\n\n\n%s\n\n%s" "$LEAD" "$TAIL" >> "$RC"
  fi

# clear ZSH_SOURCE var if zsh is not the shell
  if [[ "$CURRENT_SHELL" == bash ]]; then
    ZSH_SOURCE=
  fi

  # Make folder colors readable on WSL
  if grep -qP "WSL" "$RC" || uname -a | grep -qPi "(Microsoft|WSL)"; then
    WSL_DIR_COL="LS_COLORS=\"ow=01;36;40\" && export LS_COLORS # WSL dir colors\n"
  else
    WSL_DIR_COL=""
  fi

  # source autojump config if it exists - GH: wting/autojump
  if [ -f /usr/share/autojump/autojump."${CURRENT_SHELL}" ]; then
    AUTOJUMP=". /usr/share/autojump/autojump.${CURRENT_SHELL}"
    else
    AUTOJUMP=
  fi

  # source qfc if it exists - GH: pindexis/qfc
  if [ -f "$HOME/.qfc/README.md" ]; then
    QFC="[[ -s \"$HOME/.config/.qfc/bin/qfc.sh\" ]] && source \"$HOME/.config/.qfc/bin/qfc.sh\"\n"
    else
    QFC=
  fi

sed -i "/$LEAD/,/$TAIL/ c\
$LEAD\n\\
$WSL_DIR_COL\\
$QFC\\
alias dotloc=\"cd $DOT_LOC\"\n\\
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\\
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh\\
$AUTOJUMP\\
$DOTFILES\\
$ZSH_RC\\
$ZSH_SOURCE\n\\
$TAIL" "$RC"
#$WHAT\n\\

else
  printf "\nCurrent shell is %s\nAliases and functions only work with %s\n\n" "$CURRENT_SHELL" "$SUPPORTED_SHELLS"
fi

# Softlink config files to ~/
for file in "$DOT_LOC"/.{vimrc,tmux.conf,versions}; do
ln -sf "$file" "/home/$USERNAME/"
done

if [[ ! "$(which git)" && ! "$(which curl)" ]]; then 
printf "\n\nvim requires git and curl to install plugins!\n\n"
fi
