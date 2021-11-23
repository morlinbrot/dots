#!/usr/bin/env bash

# Install oh-my-zsh.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install Oh my fish and plugins.
# if [ ! -d $HOME/.local/share/omf ]; then
#     curl -L https://get.oh-my.fish | fish
#     omf install bass spacefish z
# fi

# Set up a symlink for Tilix's configuration issue fix.
# https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ -e "/etc/profile.d/vte-2.91.sh" ] && [ ! -e "/etc/profile.d/vte.sh" ]; then
    sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
fi

