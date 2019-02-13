#!/bin/sh
#
# See the LICENSE file for copyright and license details. 
#

xidfile="$HOME/.cache/suckless/tabbed-surf.xid"
uri="duckduckgo.com"

if [ "$#" -gt 0 ];
then
	uri="$1"
fi

runtabbed() {
	tabbed -dcn tabbed-surf -r 2 surf -e '' "$uri" >"$xidfile" \
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
		surf -e "$xid" "$uri" >/dev/null 2>&1 &
	fi
fi
