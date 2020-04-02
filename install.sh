#!/bin/bash
command -v stow > /dev/null 2>&1 || { echo >&2 "stow is not installed"; exit 1; }

set -x

stow -v -d . -t ~/ alacritty

# !r ls
