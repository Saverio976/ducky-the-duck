#!/bin/bash

NORMAL='\e[0m'
BOLD='\e[1m'
GREEN='\e[32m'
RED='\e[31m'

BASE_URL='https://raw.githubusercontent.com/Saverio976/ducky-the-duck/main/script/'
SCRIPTS=(
    'b-alias.sh'
    'b-editor.sh'
    'b-epilepsi.sh'
    'b-gcc.sh'
    'b-slow.sh'
    'b-vscode.sh'
    'b-logcmd.sh'
    'g-info.sh'
    'p-dotfile.sh'
    'p-paq.sh'

    'quit'
)

function run_script() {
    local script="$1"
    curl -sLf "${BASE_URL}${script}" | bash
}

function main() {
    echo -e "${BOLD}Ducky the Duck${NORMAL}"
    local SCRIPT=''
    while [ ! "$SCRIPT" = 'quit' ]; do
        echo -e "${BOLD}Select what to launch:${NORMAL}"
        select SCRIPT in "${SCRIPTS[@]}"; do
            break
        done < /dev/tty
        if run_script "$SCRIPT"; then
            echo -e "${GREEN}Done${NORMAL}"
        else
            echo -e "${RED}Error${NORMAL}"
        fi
        echo
        echo
    done
}

main
