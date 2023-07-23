#!/bin/bash

BASE_URL='https://raw.githubusercontent.com/Saverio976/ducky-the-duck/main/scripts/'
SCRIPTS=(
    'b-alias.sh'
    'g-info.sh'
    'quit'
)

function run_script() {
    local script="$1"
    curl -sLf "${BASE_URL}${script}" | bash
}

SCRIPT=''
while [ ! "$SCRIPT" = 'quit' ]; do
    select SCRIPT in "${SCRIPTS[@]}"; do break; done
    run_script "$SCRIPT"
done
