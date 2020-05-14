#!/usr/bin/env bash

# Install oh-my-zsh
if [ ! -x "$(command -v zsh)" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

cp ./templates/.zshrc ~/.zshrc
