#!/bin/sh
# Record for reasons packages are installed
xdg_ninja="glow jq"

all="$xdg_ninja"
sudo xbps-install -Su $all
