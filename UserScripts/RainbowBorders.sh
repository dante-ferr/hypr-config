#!/usr/bin/env bash

CONF_FILE="$HOME/.config/hypr/wallust/wallust-hyprland.conf"

if [[ ! -f "$CONF_FILE" ]]; then
    exit 1
fi

c1=$(grep '^\$color9 ' "$CONF_FILE" | awk -F '=' '{print $2}' | tr -d ' ')
c2=$(grep '^\$color10 ' "$CONF_FILE" | awk -F '=' '{print $2}' | tr -d ' ')
c3=$(grep '^\$color11 ' "$CONF_FILE" | awk -F '=' '{print $2}' | tr -d ' ')
c4=$(grep '^\$color12 ' "$CONF_FILE" | awk -F '=' '{print $2}' | tr -d ' ')
c5=$(grep '^\$color13 ' "$CONF_FILE" | awk -F '=' '{print $2}' | tr -d ' ')
c6=$(grep '^\$color14 ' "$CONF_FILE" | awk -F '=' '{print $2}' | tr -d ' ')

hyprctl keyword general:col.active_border $c1 $c2 $c3 $c4 $c5 $c6 $c1 $c2 $c3 $c4 270deg