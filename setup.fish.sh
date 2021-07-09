#!/usr/bin/env bash

# Check if omf dir already exists
if [ ! -d $HOME/.local/share/omf ]; then
    curl -L https://get.oh-my.fish | fish
    omf install bass spacefish z
fi

mkdir -p $HOME/.config/fish
cp config.fish $HOME/.config/fish/config.fish

