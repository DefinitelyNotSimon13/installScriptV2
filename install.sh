#! /usr/bin/bash
# Sources
source variables/text.sh
source variables/locations.sh
source variables/elements.sh

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

# Pacman
