#!/usr/bin/env bash

# Start a tmux session with a default window and pane setup.

tmux new-session \; \
    send-keys 'cd ~/dots' \; \
    rename-window tty \; \
    new-window \; \
    rename-window dots \; \
    new-window \; \
    rename-window vim
