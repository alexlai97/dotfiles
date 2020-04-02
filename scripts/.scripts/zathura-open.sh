#!/bin/sh
#
# See the LICENSE file for copyright and license details. 
#

xidfile="$XDG_CACHE_HOME/suckless/tabbed-zathura.xid"
file=""

if [ "$#" -gt 0 ];
then
  file="$1"
fi

runtabbed() {
	tabbed -dcn tabbed-zathura -r 2 zathura -e '' "$file" >"$xidfile" \
		2>/dev/null &
}

if [ ! -r "$xidfile" ];
then
	runtabbed
else
	xid=$(cat "$xidfile")
	xprop -id "$xid" >/dev/null 2>&1
	if [ $? -gt 0 ];
	then
		runtabbed
	else
		zathura -e "$xid" "$file" >/dev/null 2>&1 &
	fi
fi

