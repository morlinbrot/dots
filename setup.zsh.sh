#!/usr/bin/env bash

# Check if .oh-my-zsh folder already exists
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

cp ./templates/.zshrc ~/.zshrc
