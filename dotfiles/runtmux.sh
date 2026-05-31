#!/usr/bin/env bash

SESSION="$(whoami | grep -oP '^[a-zA-Z0-9\-_]+')"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux attach-session -t "$SESSION"
else
    tmux new-session -d -s "$SESSION" -n "trash"
    tmux new-window -t "$SESSION"
    tmux attach-session -t "$SESSION"
fi

