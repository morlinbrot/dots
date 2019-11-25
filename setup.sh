#!/bin/bash

# Create prx folder (some aliases will point to certain locations in here)
mkdir -p ~/prx

# VIM / NEOVIM
# Create a proxy .vimrc at the default location.
cp ./templates/.vimrc ~/.vimrc
# Create a proxy init.vim at the default location.
mkdir -p ~/.config/nvim && cp -r ./templates/nvim ~/.config
# Install all plugins.
nvim +PlugClean +PlugInstall +UpdateRemotePlugins +qall

# ZSH
cp ./templates/.zshrc ~/.zshrc

# Include git aliases.
git config --global include.path ~/configs/templates/git_aliases
# Set some other stuff for git.
git config --global core.editor "vim"
git config --global core.pager ""

# Set up a symlink for Tilix's configuration issue fix.
if [ -e "/etc/profile.d/vte-2.91.sh" ] && [ ! -e "/etc/profile.d/vte.sh" ]; then
    sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
fi

# VS Code
CODE_DIR=~/.config/Code/User/
if [ ! -d "$CODE_DIR" ]; then
    mkdir -p ~/.config/Code/User
fi
if [ -d "$CODE_DIR" ] && [[ ! -e "$CODE_DIR/keybindings.json" || ! -e "$CODE_DIR/settings.json" ]]; then
    cp ./templates/vs-code/keybindings.json ~/.config/Code/User/keybindings.json
    cp ./templates/vs-code/settings.json ~/.config/Code/User/settings.json
fi

