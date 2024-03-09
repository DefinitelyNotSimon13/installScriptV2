echo "Installing Yay"

git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si
cd ..
