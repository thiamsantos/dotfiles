#!/usr/bin/env sh

set -eu

all_pids="$(ps exa)"
pid_line=$( (echo "${all_pids}")  | rofi -dmenu -i -p "Kill processc")

if [[ -z "$pid_line" ]]
then
    return 0
else
    pid=$(echo "$pid_line" | awk '{print $1}')
    SUDO_ASKPASS="$HOME/dotfiles/i3/scripts/rofi-ask-password.sh" sudo -A kill -9 "$pid"
fi
