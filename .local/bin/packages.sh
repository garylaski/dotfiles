#!/bin/sh

base_packages() {
    base="base-system cryptsetup grub-x86_64-efi lvm2"
    video="mesa-dri mesa-vaapi mesa-vdpau mesa-vulkan-radeon"
    de="sway seatd dbus neovim foot firefox zsh jq fzf"
    fonts="noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf-extra"
    dev="git base-devel gnupg"
    audio="pipewire alsa-pipewire"
    xdg="xdg-user-dirs xdg-utils xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk"
    printf " $base $video $de $fonts $dev $audio $xdg "
}

optional_packages() {
    xdg_ninja="glow"
    rust_dev="cargo"
    flatpak="flatpak"
    screenshot="grimshot"
    image_edit="gimp"
    media_utils="ffmpeg"
    printf " $xdg_ninja $rust_dev $flatpak $screenshot $image_edit $media_utils "
}

flatpak_packages() {
    obsidian="md.obsidian.Obsidian" 
    bottles="com.usebottles.bottles"
    steam="com.valvesoftware.Steam"
    printf " $obsidian $bottles $steam "
}
