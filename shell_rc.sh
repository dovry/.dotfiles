# set $current_shell
# ps -p $$ | awk '{if (NR!=1) {print $4}}'


# print this into $current_shell files to source all functions

# source ~/.dotfiles/.shell_functions
# for function in $(grep -Po "\w+ \(\)" ~/.dotfiles/.shell_functions | awk '{ print $1 }'); do
#  export -f $function
# done

