#!/bin/bash
SESSION_NAME="ghostty"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? -eq 0 ]; then 
    tmux attach-session -t $SESSION_NAME
else
    tmux new-session -s $SESSION_NAME -d
    tmux attach-session -t $SESSION_NAME
fi
