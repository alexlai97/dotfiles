#!/usr/bin/env bash
set -eu

[[ -z "$(pgrep i3lock)" ]] || exit
i3lock -t -i /home/alexlai/.config/i3lock/startled_kitten.png
