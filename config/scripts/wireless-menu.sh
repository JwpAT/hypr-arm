#!/bin/sh

export DIALOGRC="$HOME/.config/dilog/dialogrc"
export TERM=xterm-old
unset COLORTERM

while true; do
    CHOICE=$(dialog --clear --stdout \
        --title "Control Center" \
        --menu "Select an option:" 10 50 3 \
        1 "Network Manager (nmtui)" \
        2 "Bluetooth Control (bluetuith)" \
        3 "Exit")

    case "$CHOICE" in
        1)
            TERM=xterm-old nmtui
            ;;
        2)
            bluetuith
            ;;
        3)
            clear
            break
            ;;
        *)
            break
            ;;
    esac
done
