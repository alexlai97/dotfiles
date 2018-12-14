#!/usr/bin/env bash
set -eu

[[ -z "$(pgrep i3lock)" ]] || exit
i3lock -u -t -i ${HOME}/.config/i3lock/startled_kitten.png
