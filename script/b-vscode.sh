#!/bin/bash

if [ -z "$CONFIG_FILE" ]; then
    exit 1
fi

if command -v pacman &>/dev/null; then
    echo "alias code='sudo pacman -Rs --noconfirm visual-studio-code-bin #'" >> "$CONFIG_FILE"
elif command -v apt &>/dev/null; then
    echo "alias code='sudo apt remove -y code #'" >> "$CONFIG_FILE"
elif command -v dnf &>/dev/null; then
    echo "alias code='sudo dnf remove -y code #'" >> "$CONFIG_FILE"
elif command -v yum &>/dev/null; then
    echo "alias code='sudo yum remove -y code #'" >> "$CONFIG_FILE"
elif command -v apt-get &>/dev/null; then
    echo "alias code='sudo apt-get remove -y code #'" >> "$CONFIG_FILE"
else
    echo "error: no package manager found"
    exit 1
fi
