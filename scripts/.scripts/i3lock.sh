#!/usr/bin/env bash
set -eu

IMAGE=$HOME"/.config/i3lock/startled_kitten.png"

[[ -z "$(pgrep i3lock)" ]] || exit
i3lock -t -i $IMAGE
