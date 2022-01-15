#!/bin/bash

## check if stow exists
command -v stow > /dev/null 2>&1 || { echo >&2 "stow is not installed"; exit 1; }

## print commands explicitly
set -x

## put what you want install here
stow -v -d . -t ~/ alacritty
stow -v -d . -t ~/ awesome
stow -v -d . -t ~/ bash
stow -v -d . -t ~/ bat
stow -v -d . -t ~/ calcurse
stow -v -d . -t ~/ conky
stow -v -d . -t ~/ dmenu-extended
stow -v -d . -t ~/ doom-emacs
stow -v -d . -t ~/ dunst
stow -v -d . -t ~/ fcitx
stow -v -d . -t ~/ fish
stow -v -d . -t ~/ ghc
stow -v -d . -t ~/ git
stow -v -d . -t ~/ gtk-2.0
stow -v -d . -t ~/ gtk-3.0
stow -v -d . -t ~/ htop
stow -v -d . -t ~/ hunter
stow -v -d . -t ~/ i3
stow -v -d . -t ~/ i3status
stow -v -d . -t ~/ ideavim
stow -v -d . -t ~/ install.sh
stow -v -d . -t ~/ juypter
stow -v -d . -t ~/ mbsync
stow -v -d . -t ~/ mimeapps
stow -v -d . -t ~/ mpd
stow -v -d . -t ~/ mps-youtube
stow -v -d . -t ~/ msmtp
stow -v -d . -t ~/ mutt
stow -v -d . -t ~/ ncmpcpp
stow -v -d . -t ~/ neofetch
stow -v -d . -t ~/ newsboat
stow -v -d . -t ~/ notmuch
stow -v -d . -t ~/ npm
stow -v -d . -t ~/ nvim
stow -v -d . -t ~/ picom
stow -v -d . -t ~/ qutebrowser
stow -v -d . -t ~/ ranger
stow -v -d . -t ~/ redshift
stow -v -d . -t ~/ rofi
stow -v -d . -t ~/ scripts
stow -v -d . -t ~/ starship
stow -v -d . -t ~/ sxhkd
stow -v -d . -t ~/ sxiv
stow -v -d . -t ~/ systemd
stow -v -d . -t ~/ termite
stow -v -d . -t ~/ themes
stow -v -d . -t ~/ tint2
stow -v -d . -t ~/ tmux
stow -v -d . -t ~/ urlscan
stow -v -d . -t ~/ vifm
stow -v -d . -t ~/ vim
stow -v -d . -t ~/ vimb
stow -v -d . -t ~/ weechat
stow -v -d . -t ~/ wpg
stow -v -d . -t ~/ x
stow -v -d . -t ~/ xmonad
stow -v -d . -t ~/ zathura
stow -v -d . -t ~/ zim
stow -v -d . -t ~/ zsh
