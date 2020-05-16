#!/bin/bash

DEFAULT_THEME=nord

THEME=${1:-"$DEFAULT_THEME"}
TARGET_DIR=~
CURR_CONFIG_FILE=.currconfig

if [ -f "$CURR_CONFIG_FILE" ]; then
	CURR_CONFIG="$(<"$CURR_CONFIG_FILE")"
	(cd "$CURR_CONFIG"; stow -D * -t "$TARGET_DIR")
else
	touch "$CURR_CONFIG_FILE"
fi

if [ -d "$THEME" ]; then
	echo $THEME > "$CURR_CONFIG_FILE"
	(cd "$THEME"; stow * -t "$TARGET_DIR")
else
	echo "Could not find theme $THEME"
fi

