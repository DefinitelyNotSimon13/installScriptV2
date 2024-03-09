#! /usr/bin/bash
# Sources
source variables/text.sh
source variables/locations.sh
source variables/elements.sh
source functions/functions.sh

# 1. Pacman packages
# 2. Install YAY
# 3. YAY Packages
# 4. Get Other stuff (e.g. repos)
# 5. Install things not installed yet
# 6. Configs

# Welcome Screen
clear
printf "\n%s\n" "$VDIVC"
printf "%-2s%-76s%-2s\n" "| " "Welcome to the Catppuccin Dotfiles install script!" " |"
printf "%s\n\n" "$VDIVC"

# Check if another installtion is running
if [ -f "$LOCK" ]; then
    printf "%s already exists \n%bAnother installation seems to be running!%b\n\n" \
        "$LOCK" \
        "$RED" \
        "$CLEAR"
    printf "If you are sure, that there are no other installatios running,\n\
you may delete that file.\n\n"
    printf "%bExiting...%b\n" "$ITALIC" "$CLEAR"
    exit 1
fi

mkdir "$HOME"/.installCache
cd "$HOME"/.installCache || exit 1

git clone "https://github.com/DefinitelyNotSimon13/installScriptV2" .

source installation/pacmanPackages.sh

source installation/installYay.sh

source installation/yayPackages.sh

confirmYN

echo "Done installing stuff!"

echo "Getting github repo"

git clone --recurse-submodules "https://github.com/DefinitelyNotSimon13/Catppuccin-Dotfiles" "$HOME"/dotfiles


cd "$HOME" || exit 1
rm -rf .config
mkdir .config
mkdir 1_Coding
cd dotfiles || exit 1
git checkout personal
git submodule update --init --recursive
stow .
sudo cp nonUserConfig/grub /etc/default/grub -f
sudo cp nonUserConfig/sddm.conf /etc/sddm.conf -f
sudo cp nonUserConfig/pacman.conf /etc/pacman.conf -f
mkdir /usr/share/sddm/themes -p
sudo cp nonUserConfig/sddmTheme/* /usr/share/sddm/themes/ -rf
sudo cp nonUserConfig/grubTheme/* /usr/share/grub/themes/ -rf

sudo systemctl enable sddm

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Grub and SDDM configured"

echo "Github"
gh auth login

rm -rf "$HOME"/.installCache
continueYN "You should reboot now. Do you want to reboot now?" || exit 1

sudo reboot now


# Pacman
