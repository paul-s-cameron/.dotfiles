#!/bin/bash

player_status=$(playerctl status -p brave 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl -p brave metadata artist)
    title=$(playerctl -p brave metadata title)
    # Escape special characters for JSON
    artist=$(echo "$artist" | sed 's/&/&amp;/g')
    title=$(echo "$title" | sed 's/&/&amp;/g')
    echo "$artist - $title"
fi