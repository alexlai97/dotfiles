#!/bin/bash

## check if stow exists
command -v stow > /dev/null 2>&1 || { echo >&2 "stow is not installed"; exit 1; }

## print commands explicitly
set -x

## put what you want install here
stow -v -d . -t ~/ x
stow -v -d . -t ~/ vifm
stow -v -d . -t ~/ vim
stow -v -d . -t ~/ nvim
stow -v -d . -t ~/ tmux
