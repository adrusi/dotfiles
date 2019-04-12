if [ "$(tty)" = "/dev/tty1" ]; then
    systemd-cat --identifier=sway sway >/dev/null 2>/dev/null
    exit 0 >/dev/null 2>/dev/null
fi
