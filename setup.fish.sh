#!/usr/bin/env bash

# Check if omf dir already exists
if [ ! -d $HOME/.local/share/omf ]; then
    curl -L https://get.oh-my.fish | fish
fi

mkdir -p $HOME/.config/fish
cp fish.config $HOME/.config/fish/config.fish

