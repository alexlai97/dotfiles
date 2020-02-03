#!/bin/dash

TERMINAL="termite"
SESSION_NAME="Daily"

if tmux has-session -t $SESSION_NAME; then
  $TERMINAL -e "tmux attach -t $SESSION_NAME"
else
  $TERMINAL -e "tmux new-session -t $SESSION_NAME"
fi
