#!/bin/bash

# 1. Trava de tempo (Debounce de 500ms). Ignora sinais duplicados do Hyprland.
NOW=$(date +%s%3N)
if [ -f /tmp/hypremoji_time ]; then
    LAST=$(cat /tmp/hypremoji_time)
    if [ $((NOW - LAST)) -lt 10 ]; then
        exit 0
    fi
fi
echo "$NOW" > /tmp/hypremoji_time

# 2. Limpa o lixo da memória e abre a janela fresca instantaneamente
pkill -x hypremoji
hypremoji &