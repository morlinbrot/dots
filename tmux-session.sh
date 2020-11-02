#!/usr/bin/env bash

# Start a tmux session with a default window and pane setup.

session="main"
win1="tty"
win2="proj"

tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]
then
    tmux new-session -d -s $session
    tmux send-keys 'cd ~/dots' Enter C-l;
fi

tmux select-window -t $session:1;
tmux rename-window $win1;

tmux select-window -t $session:2 2>/dev/null;
if [ $? != 0 ]
then
    tmux new-window;
    tmux send-keys 'cd ~/prx' Enter C-l;
fi

tmux rename-window $win2;
tmux select-window -t $win1;

tmux attach-session -t $session 

