#!/usr/bin/env bash

# Create a proxy init.vim at the default location.
mkdir -p ~/.config/nvim && cp -r ./nvim ~/.config

# Needs to be explicitly set when running rustfmt throught nvim's neoformat plugin.
mkdir -p ~/.config/rustfmt && cp ./templates/rustfmt.toml ~/.config/rustfmt/rustfmt.toml

# Install all plugins.
nvim +PlugClean +PlugInstall +UpdateRemotePlugins +qall
