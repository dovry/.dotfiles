#!/bin/bash
#set -x
#HOMEFOLDER=
BASHRC="~/.bashrc"
LEAD="### MANAGED BY DOTFILES"
TAIL="### END MANAGED BY DOTFILES"

# set $current_shell
# ps -p $$ | awk '{if (NR!=1) {print $4}}'

#if ! grep -Po "$LEAD" "$BASHRC" ; then
#cat << 'EOF' >> "$BASHRC"

#sed -i "/$LEAD/,/$TAIL/ c\
#$LEAD\
#\n\n\
#. /usr/share/autojump/autojump.sh\n\
#. ~/.dotfiles/.shell_aliases\n\
#. ~/.dotfiles/.shell_functions\n\
#\n\
#$TAIL
#" $BASHRC

var="\
string one
string two
string three"

echo "$var"