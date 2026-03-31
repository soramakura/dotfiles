#!/bin/bash -xeu

sudo dnf install niri
# Remove unnecessary UIs
sudo dnf remove alacritty fuzzel swaylock waybar

# Link the config files
DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

ln -snf "${DOTFILES_DIR}/config/niri" "${HOME}/.config/"
