#!/bin/bash -xeu

readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install dependencies
source ${DOTFILES_DIR}/scripts/fedora/install_python3.sh

sudo dnf install fuzzel

# Link the configuration files
ln -snf ${DOTFILES_DIR}/config/fuzzel ~/.config/

# Link the custom scripts
ln -snf "${DOTFILES_DIR}/config/fuzzel/scripts/fuzzel_audio" "${HOME}/.local/bin"
ln -snf "${DOTFILES_DIR}/config/fuzzel/scripts/fuzzel_power" "${HOME}/.local/bin"
ln -snf "${DOTFILES_DIR}/config/fuzzel/scripts/networkmanager_dmenu" "${HOME}/.local/bin"
ln -snf "${DOTFILES_DIR}/config/fuzzel/scripts/rofi-bluetooth" "${HOME}/.local/bin"
