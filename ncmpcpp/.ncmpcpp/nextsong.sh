#!/usr/bin/env bash

fullname=$(mpc current)

if [ -n "$fullname" ]; then
  notify-send -t 5000 "Current playing song is" "$( cut -d '-' -f 2- <<< ${fullname} ) \n   by $( cut -d '-' -f 1 <<< ${fullname} )"
else
  notify-send -t 5000 "No song is playing now."
fi


