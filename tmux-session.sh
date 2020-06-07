#!/usr/bin/env bash

# Start a tmux session with a default window and pane setup.

tmux new-session \; \
    send-keys 'cd ~/dots' Enter C-l \; \
    rename-window tty \; \
    new-window \; \
    rename-window proj \; \
    select-window -t tty \; \

