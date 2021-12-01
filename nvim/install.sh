#! /usr/bin/env bash

cwd=$(pwd)

cd ~/

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

sudo ln -sf ~/nvim.appimage /usr/bin/nvim

cd $cwd
