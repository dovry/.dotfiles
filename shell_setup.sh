#!/bin/bash

# ---- Non POSIX compliant
BIN=${0/#[!\/]/"$PWD/${0:0:1}"};
DOT_LOC=${BIN%/*}
# ----

CURRENT_SHELL="$(getent passwd "$(id -u -n)" | awk -F: '{print $NF}' | sed -n -e "s/^.*bin\///p")" && export CURRENT_SHELL

LEAD="### MANAGED BY DOTFILES"
TAIL="### END MANAGED BY DOTFILES"
RC="${HOME}/.${CURRENT_SHELL}rc"
# zsh source
ZSH_SOURCE=". ${HOME}/.oh-my-zsh/oh-my-zsh.sh"
ZSH_RC=". ${DOT_LOC}/.zshrc"
DOTFILES="\
. ${DOT_LOC}/.shell_aliases\n\
. ${DOT_LOC}/.shell_functions\
"
# Check which shell, then run config

if [ "$CURRENT_SHELL" = zsh ] || [ "$CURRENT_SHELL" = bash ]; then
  # look for 'managed by dotfiles' marker, if present, ignore, if not, backup file and run script
  if  grep -qo "$LEAD" "$RC" ; then
    :
  else
    if [ -f "$HOME"/.zshrc ] && [ ! -f "$HOME"/.zshrc.bak ]; then
      cp "$HOME"/.zshrc "$HOME"/.zshrc.bak
      printf "%s\n# your original file was backed up to ~/.zshrc.bak" "${ZSH_VER}" > "$HOME"/.zshrc
    else
      :
    fi
    printf "\n%s\n%s" "$LEAD" "$TAIL" >> "$RC"
  fi

# clear ZSH_SOURCE var if zsh is not the shell
  if [ "$CURRENT_SHELL" != zsh ]; then
    ZSH_SOURCE="#ZSH_SOURCE shell not zsh"
  fi

  # Make folder colors readable on WSL
  if grep -qP "WSL" "$RC" || uname -a | grep -qPi "(Microsoft|WSL)"; then
    WSL_DIR_COL="LS_COLORS=\"ow=01;36;40\" && export LS_COLORS # WSL dir colors\n"
  else
    WSL_DIR_COL="#WSL_DIR_COL not WSL, no colour to set"
  fi
  # source autojump config if it exists - GH: wting/autojump
  if [ -f /usr/share/autojump/autojump."${CURRENT_SHELL}" ]; then
    AUTOJUMP=". /usr/share/autojump/autojump.${CURRENT_SHELL}"
    else
    AUTOJUMP="#AUTOJUMP not installed"
  fi

  if [ -d "$HOME/.antigen" ]; then
    ANTI_GEN=". $HOME/.antigen/antigen.zsh"
  elif [ -f "$HOME/antigen.zsh" ]; then
    ANTI_GEN=". $HOME/.config/antigen.zsh"
  else
    ANTI_GEN="#ANTI_GEN antigen not installed"
  fi


sed -i "/$LEAD/,/$TAIL/ c\
$LEAD\n\\
$WSL_DIR_COL\\
alias dotloc=\"cd $DOT_LOC\"\n\\
$DOTFILES\\
$ZSH_RC\\
$ZSH_SOURCE\\
$AUTOJUMP\\
$ANTI_GEN\\
\\
$TAIL" "$RC"
#$WHAT\n\\

else
  SUPPORTED_SHELLS="bash and zsh"
  printf "\nCurrent shell is %s\nAliases and functions only work with %s\n\n" "$CURRENT_SHELL" "$SUPPORTED_SHELLS"
  exit 1
fi

# Softlink config files to ~/
for file in "$DOT_LOC"/.vimrc "$DOT_LOC"/.tmux.conf "$DOT_LOC"/.versions; do
ln -sf "$file" "$HOME"
done
if [ ! "$(git --version)" ] && [ ! "$(curl --version)" ]; then
printf "\n\nvim requires git and curl to install plugins!\n\n"
fi

exit 0