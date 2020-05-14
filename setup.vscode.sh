#!/usr/bin/env bash

# VS Code
CODE_DIR=~/.config/Code/User/
if [ ! -d "$CODE_DIR" ]; then
    mkdir -p ~/.config/Code/User
fi
if [ -d "$CODE_DIR" ] && [[ ! -e "$CODE_DIR/keybindings.json" || ! -e "$CODE_DIR/settings.json" ]]; then
    cp ./templates/vs-code/keybindings.json ~/.config/Code/User/keybindings.json
    cp ./templates/vs-code/settings.json ~/.config/Code/User/settings.json
fi

