source $HOME/.config/sh/profile
[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway
