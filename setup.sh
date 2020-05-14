#!/bin/bash

# Re-map Caps Lock to Ctrl
setxkbmap -option caps:ctlr_modifier

# Create prx folder (some aliases will point to certain locations in here)
mkdir -p ~/prx

. ./setup.zsh.sh
. ./setup.nvim.sh
. ./setup.git.sh
. ./setup.alacritty.sh

