#!/bin/bash

WALLPAPER="$(caelestia shell wallpaper get)"
TARGET="$HOME/.config/quickshell/overview/current-wallpaper.jpg"

if [ -f "$WALLPAPER" ]; then
    cp -f "$WALLPAPER" "$TARGET"
    echo "Wallpaper synced: $WALLPAPER"
fi
