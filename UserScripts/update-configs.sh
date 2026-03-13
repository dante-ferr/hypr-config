#!/bin/bash

GITHUB_USER="dante-ferr"
BASE_DIR="$HOME/.config"

declare -A REPOS=(
    ["hypr-config"]="hypr"
    ["waybar-config"]="waybar"
    ["kitty-config"]="kitty"
    ["waypaper-config"]="waypaper"
    ["wallust-config"]="wallust"
)

for repo in "${!REPOS[@]}"; do
    target_dir="$BASE_DIR/${REPOS[$repo]}"
    repo_url="git@github.com:$GITHUB_USER/$repo.git"

    if [ -d "$target_dir/.git" ]; then
        cd "$target_dir" || continue
        echo "Updating $target_dir"
        git checkout master
        git fetch
        git pull origin master
        cd - > /dev/null || continue
    else
        git clone "$repo_url" "$target_dir"
    fi
done