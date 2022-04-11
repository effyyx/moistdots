#!/usr/bin/env bash

## Files and Directories
DIR="$HOME/.config/polybar"
SFILE="$DIR/system"
RFILE="$DIR/.system"
MFILE="$DIR/.module"

## Launch Polybar with selected style
launch_bar() {
	CARD=$(basename "$(find /sys/class/backlight/* | head -n 1)")
	if [[ "$CARD" != *"intel_"* ]]; then
		if [[ ! -f "$MFILE" ]]; then
			sed -i -e 's/backlight/brightness/g' "$DIR"/config
			touch "$MFILE"
		fi
	fi
		
	if [[ ! $(pidof polybar) ]]; then
		polybar -q bar -c "$DIR"/config &
	else
		polybar-msg cmd restart
	fi
}

launch_bar
