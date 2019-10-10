#!/bin/bash
scriptDir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
notify-send -i "$scriptDIR/icons/vs-code.png" "Launching VS Code" "One moment"
code
