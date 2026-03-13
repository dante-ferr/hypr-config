#!/bin/bash

mapfile -t active_walls < <(swww query | grep -o '/.*')
mapfile -t unique_walls < <(printf "%s\n" "${active_walls[@]}" | sort -u)

if [ ${#unique_walls[@]} -ge 2 ]; then
    magick "${unique_walls[0]}" -scale 500x500 "${unique_walls[1]}" -scale 500x500 +append /tmp/combined_palette.png
    wallust run -q /tmp/combined_palette.png
elif [ -n "$1" ]; then
    wallust run -q "$1"
fi

~/.config/hypr/scripts/Refresh.sh &