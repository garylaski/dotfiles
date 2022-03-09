#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"
unsetopt PROMPT_SP

# Default programs:
export SVDIR="$HOME/.local/service"
export EDITOR="vim"
export TERM="foot"
export BROWSER="apulse env GDK_BACKEND=wayland librewolf"
export LAUNCHER="foot --window-size-pixels=400x200 -a=menu menu"
export TZ='America/New_York'

# Setting $XDG_RUNTIME_DIR
if test -z "${XDG_RUNTIME_DIR}"; then
     export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
     if ! test -d "${XDG_RUNTIME_DIR}"; then
         mkdir "${XDG_RUNTIME_DIR}"
         chmod 0700 "${XDG_RUNTIME_DIR}"
     fi
fi

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GPG_TTY=$(tty)

# Other program settings:
export MOZ_ENABLE_WAYLAND=1
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LS_COLORS=$LS_COLORS:'ow=30;44:'
export CLASSPATH="$XDG_DATA_HOME/java"

# Add private environmental vars
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env-private" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env-private"

[ "$(tty)" = "/dev/tty1" ] && sway
