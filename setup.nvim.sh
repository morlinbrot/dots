#!/usr/bin/env bash

# NVIM
# Create a proxy .vimrc at the default location.
cp ./templates/.vimrc ~/.vimrc

# Create a proxy init.vim at the default location.
mkdir -p ~/.config/nvim && cp -r ./templates/nvim ~/.config

# Install all plugins.
nvim +PlugClean +PlugInstall +UpdateRemotePlugins +qall

