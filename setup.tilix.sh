#!/usr/bin/env bash

# Set up a symlink for Tilix's configuration issue fix.
# https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ -e "/etc/profile.d/vte-2.91.sh" ] && [ ! -e "/etc/profile.d/vte.sh" ]; then
    sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
fi
