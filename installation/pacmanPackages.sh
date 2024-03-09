#! /bin/bash

source variables/text.sh
source functions/functions.sh

printf "%b" "$ITALIC"
cat other/packages.md
printf "%bAll packages above will be installed\n" "$CLEAR"
if ! confirmYN "Are you sure?"; then
    printf "\nThe packages wich will be installed by pacman can be customized by editing \n\
\"installation/pacmanPackages.sh\"\n"
    printf "%bWARNING: Removing packages can mess up depencies!%b\n" "$RED$BOLD" "$CLEAR"
    printf "%bExiting...\n%b" "$ITALIC" "$CLEAR"
    exit 1
fi
sudo pacman -S --noconfirm \
    --needed base-devel \
    wayland \
    sddm \
    ttf-jetbrains-mono-nerd \
    kitty \
    alacritty \
    tmux \
    zsh \
    rofi \
    waybar \
    neovim \
    dunst \
    hyprland \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    git \
    polkit \
    polkit-gnome \
    qt5-wayland \
    qt6-wayland \
    firefox \
    python \
    python-pip \
    npm \
    hyprpaper \
    cliphist \
    dolphin \
    os-prober \
    qt5-graphicaleffects \
    qt5-svg \
    qt5-quickcontrols2 \
neofetch \
    papirus-icon-theme \
    mpd \
    btop \
    mc \
    dconf-editor \
    ttf-dejavu \
    nwg-look \
    ddcutil \
    i2c-tools \
    unzip \
    linux-headers \
    linux-lts-headers \
    pavucontrol \
    networkmanager \
    network-manager-applet \
    pipewire \
    stow \
    pipewire-pulse \
    grim \
    qt5ct \
    qt6ct \
    curl \
    lazygit \
    python3 \
    python-gobject \
    pacman-contrib \
    viewnior \
    thunderbird \
    zoxide \
    zip \
    tree \
    thefuck \
    snapper \
    noto-fonts \
    noto-fonts-emoji \
    ncdu \
    man-db \
    man-pages \
    linux-lts \
    kvantum \
    github-cli \
    fzf \
    evince \
    brightnessctl
