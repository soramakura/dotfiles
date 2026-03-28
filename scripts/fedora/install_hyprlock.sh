#!/bin/bash -xeu

readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

sudo dnf copr enable solopasha/hyprland
sudo dnf install hyprlock

# Link the configuration files
ln -snf ${DOTFILES_DIR}/config/hypr ~/.config/
