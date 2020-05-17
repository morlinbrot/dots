#!/usr/bin/env bash

# Re-map Caps Lock to Ctrl
setxkbmap -option caps:ctrl_modifier

# Create prx folder (some aliases will point to certain locations in here)
mkdir -p ~/prx

. ./setup.zsh.sh
. ./setup.nvim.sh
. ./setup.git.sh
. ./setup.alacritty.sh
. ./setup.tmux.sh
. ./setup.fish.sh
. ./setup.bat.sh

