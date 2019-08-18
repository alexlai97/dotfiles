#!/bin/bash
set -x

stow -d . -t ~/ alacritty
stow -d . -t ~/ awesome
stow -d . -t ~/ bash
stow -d . -t ~/ compton
stow -d . -t ~/ conky
stow -d . -t ~/ dunst
stow -d . -t ~/ enpitsu
stow -d . -t ~/ fcitx
stow -d . -t ~/ fish
stow -d . -t ~/ ghc
stow -d . -t ~/ gtk-2.0
stow -d . -t ~/ gtk-3.0
stow -d . -t ~/ i3
stow -d . -t ~/ i3status
stow -d . -t ~/ install.sh
stow -d . -t ~/ mpd
stow -d . -t ~/ mps-youtube
stow -d . -t ~/ mutt
stow -d . -t ~/ ncmpcpp
stow -d . -t ~/ nvim
stow -d . -t ~/ ranger
stow -d . -t ~/ redshift
stow -d . -t ~/ rofi
stow -d . -t ~/ scripts
stow -d . -t ~/ sxhkd
stow -d . -t ~/ sxiv
stow -d . -t ~/ themes
stow -d . -t ~/ tint2
stow -d . -t ~/ tmux
stow -d . -t ~/ vim
stow -d . -t ~/ vimb
stow -d . -t ~/ wpg
stow -d . -t ~/ zathura
stow -d . -t ~/ zim
stow -d . -t ~/ zsh

sudo stow -d . -t / portage
