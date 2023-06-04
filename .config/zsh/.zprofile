#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Add yabridge to $PATH
export PATH="$PATH:$HOME/.local/share/yabridge"
unsetopt PROMPT_SP

# Default programs:
export EDITOR="vim"
export TERM="foot"
export BROWSER="firefox-wayland"
export LAUNCHER="foot --window-size-pixels=400x200 -a=menu menu"
export TZ='America/Los_Angeles'

# XDG Base Directory 
if test -z "${XDG_RUNTIME_DIR}"; then
     export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir"
     if ! test -d "${XDG_RUNTIME_DIR}"; then
         mkdir "${XDG_RUNTIME_DIR}"
         chmod 0700 "${XDG_RUNTIME_DIR}"
     fi
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# ~/ Clean-up:
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="-"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export HISTFILE="$XDG_DATA_HOME/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"                     
export GOPATH="$XDG_DATA_HOME/go"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export CLASSPATH="$XDG_DATA_HOME/java"

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LS_COLORS=$LS_COLORS:'ow=30;44:'

# Add private environmental vars
[ -f "$XDG_CONFIG_HOME/shell/env-private" ] && source "$XDG_CONFIG_HOME/shell/env-private"
# ENV VAR FOR PLATFORM
if [ -d "/proc/acpi/button/lid" ]; then
    export IS_DESKTOP=0
else
    export IS_DESKTOP=1
fi

# git setup
git config --global user.name "gary"
git config --global user.email $GIT_EMAIL
git config --global user.signingkey $GIT_SIGNINGKEY
git config --global commit.gpgsign true

[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway
