#!/bin/bash -xeu

sudo dnf install niri

# Link the config files
DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

ln -snf "${DOTFILES_DIR}/config/niri" "${HOME}/.config/"
