#!/bin/bash
command -v stow > /dev/null 2>&1 || { echo >&2 "stow is not installed"; exit 1; }

set -x

stow -v -d . -t ~/ alacritty
stow -v -d . -t ~/ awesome
stow -v -d . -t ~/ bash
stow -v -d . -t ~/ compton
stow -v -d . -t ~/ conky
stow -v -d . -t ~/ dunst
stow -v -d . -t ~/ enpitsu
stow -v -d . -t ~/ fcitx
stow -v -d . -t ~/ fish
stow -v -d . -t ~/ ghc
stow -v -d . -t ~/ gtk-2.0
stow -v -d . -t ~/ gtk-3.0
stow -v -d . -t ~/ i3
stow -v -d . -t ~/ i3status
stow -v -d . -t ~/ mpd
stow -v -d . -t ~/ mps-youtube
stow -v -d . -t ~/ mutt
stow -v -d . -t ~/ ncmpcpp
stow -v -d . -t ~/ nvim
stow -v -d . -t ~/ ranger
stow -v -d . -t ~/ redshift
stow -v -d . -t ~/ rofi
stow -v -d . -t ~/ scripts
stow -v -d . -t ~/ sxhkd
stow -v -d . -t ~/ sxiv
stow -v -d . -t ~/ themes
stow -v -d . -t ~/ tint2
stow -v -d . -t ~/ tmux
stow -v -d . -t ~/ vim
stow -v -d . -t ~/ vimb
stow -v -d . -t ~/ wpg
stow -v -d . -t ~/ zathura
stow -v -d . -t ~/ zim
stow -v -d . -t ~/ zsh

sudo stow -v -d . -t / portage
