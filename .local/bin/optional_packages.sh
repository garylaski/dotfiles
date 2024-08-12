#!/bin/sh
. packages.sh
sudo xbps-install -Su $(optional_packages)

flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub $(flatpak_packages)

# Check installed packages to make sure only the necessary packages are installed
installed_packages=$(xbps-query -m | sed 's/-[0-9+_.].*//')
all="$(base_packages; optional_packages)"
for package in $installed_packages; do
    case $all in
        *" $package "*) ;;
        *) echo "WARNING: $package found, yet not recorded.";; 
    esac
done

flatpak_installed=$(flatpak list --app --columns=application)
all="$(flatpak_packages)"
for package in $flatpak_installed; do
    case $all in
        *" $package "*) ;;
        *) echo "WARNING: $package found, yet not recorded.";; 
    esac
done
