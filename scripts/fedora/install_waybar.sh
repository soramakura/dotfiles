#!/bin/bash -xeu

readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

sudo dnf install waybar

# Link the configuration files
ln -snf ${DOTFILES_DIR}/config/waybar ~/.config/
