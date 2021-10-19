#!/usr/bin/env sh

set -eu

chosen=$(echo "[Cancel]\nLock\nLogout\nSuspend\nHibernate\nReboot\nShutdown" | rofi -dmenu -i)

case $chosen in
    Lock)
        sh ~/.config/i3/scripts/lock.sh
        ;;
    Logout)
        i3-msg exit
        ;;
    Suspend)
        sh ~/.config/i3/scripts/lock.sh && systemctl suspend
        ;;
    Hibernate)
        sh ~/.config/i3/script/lock.sh && systemctl suspend
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl systemctl poweroff -i
        ;;
    *)
        exit 0
        ;;
esac
