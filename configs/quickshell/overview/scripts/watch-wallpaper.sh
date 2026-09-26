#!/bin/bash

TARGET="$HOME/.config/quickshell/overview/current-wallpaper.jpg"
LAST=""

while true; do
    CURRENT="$(caelestia shell wallpaper get 2>/dev/null)"

    if [ -n "$CURRENT" ] && [ -f "$CURRENT" ] && [ "$CURRENT" != "$LAST" ]; then

        # Remove old file/symlink
        rm -f "$TARGET"

        # Create a REAL copy, not a symlink
        cp "$CURRENT" "$TARGET"

        LAST="$CURRENT"

        echo "Wallpaper changed: $CURRENT"
    fi

    sleep 1
done