#!/bin/bash

# Snippet to check if script is being run as root or not, and exits accordingly

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
# echo "${red}red text ${green}green text${reset}"

# use != and remove 'NOT' if it must be run as root
if [ "$(whoami)" == 'root' ]; then
  printf "${green}~~~\n${red}This script must NOT be run as root\n${green}~~~${reset}\n"
  exit 1
fi

echo $(whoami)
