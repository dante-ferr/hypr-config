#!/bin/bash

GIF_DIR="$HOME/Pictures/pixel-gifs"

if [ ! -d "$GIF_DIR" ] || [ -z "$(ls -A "$GIF_DIR")" ]; then
    exit 1
fi

RANDOM_GIF=$(find "$GIF_DIR" -maxdepth 1 -iname "*.gif" | shuf -n 1)

WIDTH=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of default=nw=1:nk=1 "$RANDOM_GIF")

SCALE_OPT=""
if [ "$WIDTH" -lt 350 ]; then
    SCALE_OPT="--window-scale=2"
fi

# --scale=nearest: Remove o anti-aliasing, mantendo os pixels perfeitamente nítidos
mpv --title="pixel-art-widget" \
    --vo=gpu \
    --scale=nearest \
    --background=color \
    --background-color="#CC060606" \
    --border=no \
    --loop-file=inf \
    --osc=no \
    --osd-level=0 \
    $SCALE_OPT \
    "$RANDOM_GIF"