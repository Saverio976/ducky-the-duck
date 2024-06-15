#!/bin/bash

if [ -z "$CONFIGFILE" ]; then
    exit 1
fi

if command -v pacman &>/dev/null; then
    echo "alias code='sudo pacman -Rs --noconfirm visual-studio-code-bin #'" >> "$CONFIGFILE"
elif command -v apt &>/dev/null; then
    echo "alias code='sudo apt remove -y code #'" >> "$CONFIGFILE"
elif command -v dnf &>/dev/null; then
    echo "alias code='sudo dnf remove -y code #'" >> "$CONFIGFILE"
elif command -v yum &>/dev/null; then
    echo "alias code='sudo yum remove -y code #'" >> "$CONFIGFILE"
elif command -v apt-get &>/dev/null; then
    echo "alias code='sudo apt-get remove -y code #'" >> "$CONFIGFILE"
else
    echo "error: no package manager found"
    exit 1
fi
