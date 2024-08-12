#!/bin/sh
. packages.sh

sudo xbps-install -Su $(base_packages)
chsh -s /bin/zsh $USER
sudo usermod -a -G _seatd $USER

XDG_DIRS="PICTURES DOWNLOAD DESKTOP MUSIC VIDEOS DOCUMENTS"
for DIR in $XDG_DIRS; do 
    mkdir -p $(xdg-user-dir $DIR)
done
mkdir -p $(dirname $HISTFILE) && touch $HISTFILE
LEFTOVER_DOTS=".bash_profile  .lesshst .bash_history  .bashrc .bash_logout .inputrc"
for FILE in $LEFTOVER_DOTS; do
    rm -f $FILE
done

sudo sed -r "s/\"--noclear\"/\"--autologin gary --noclear\"/g" -i /etc/sv/agetty-tty1/conf
