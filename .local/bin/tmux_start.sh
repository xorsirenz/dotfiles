#!/bin/sh

SESSION=0

while tmux has-session -t "$SESSION" 2>/dev/null; do
  ((SESSION++))
done

exec tmux new-session -A -s "$SESSION"
