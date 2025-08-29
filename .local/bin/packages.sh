#!/bin/sh

base_packages() {
    base="base-system cryptsetup grub-x86_64-efi grub lvm2"
    if [ $IS_DESKTOP = 0 ]; then
        video="mesa-dri intel-video-accel vulkan-loader mesa-vulkan-intel"
    else
        video="mesa-dri mesa-vaapi mesa-vdpau mesa-vulkan-radeon"
    fi
    de="xtools sway seatd dbus nodejs neovim 7zip unzip curl wget gzip alacritty firefox zsh jq fzf htop zenity ripgrep"
    fonts="noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf-extra"
    dev="git gdb base-devel gnupg python3-pip cloc"
    audio="pipewire alsa-pipewire"
    xdg="xdg-user-dirs xdg-utils xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk"
    printf " $base $video $de $fonts $dev $audio $xdg "
}

optional_packages() {
    xdg_ninja="glow"
    flatpak="flatpak"
    screenshot="grimshot"
    image_edit="gimp"
    media_utils="picard ffmpeg mpv"
    lsp="black lua-language-server pyright cargo rust-analyzer"
    printf " $xdg_ninja $flatpak $screenshot $image_edit $media_utils $lsp "
}

flatpak_packages() {
    obsidian="md.obsidian.Obsidian" 
    bottles="com.usebottles.bottles"
    steam="com.valvesoftware.Steam"
    printf " $obsidian $bottles $steam "
}

sudo xbps-install -Syu $(optional_packages) $(base_packages)
sudo xbps-install -Syu

flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub $(flatpak_packages)
flatpak --user update

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
