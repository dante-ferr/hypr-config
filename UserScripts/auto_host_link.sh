#!/usr/bin/env bash

HOST=$(cat /etc/hostname)
HOST_FILE="$HOME/.config/hypr/hosts/${HOST}.conf"
LINK_FILE="$HOME/.config/hypr/hosts/current_device.conf"

if [[ ! -f "$HOST_FILE" ]]; then
    touch "$HOST_FILE"
fi

CURRENT_LINK=$(readlink "$LINK_FILE")

if [[ "$CURRENT_LINK" != "$HOST_FILE" ]]; then
    ln -sf "$HOST_FILE" "$LINK_FILE"
    hyprctl reload
fi