#!/bin/bash

. ./.shell_vars

# set $current_shell
# ps -p $$ | awk '{if (NR!=1) {print $4}}'

#if ! grep -Po "$LEAD" "$BASHRC" ; then
#cat << 'EOF' >> "$BASHRC"

sed -i "/$LEAD/,/$TAIL/ c\
$LEAD\
\n\n\
. /usr/share/autojump/autojump.sh\
$DOTFILES\\
\n\
$TAIL
" ~/Downloads/test #$BASHRC
