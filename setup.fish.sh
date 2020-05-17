#!/usr/bin/env bash

# Check if omf dir already exists
if [ ! -d $HOME/.local/share/omf ]; then
    curl -L https://get.oh-my.fish | fish
fi

cp fish.config $HOME/.config/fish/config.fish

