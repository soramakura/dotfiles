#!/bin/bash -xeu

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install dependencies
source "${DOTFILES_DIR}/scripts/fedora/install_niri.sh"

sudo dnf copr enable avengemedia/dms
sudo dnf install dms
systemctl --user add-wants niri.service dms

# Link the config files
ln -snf ${DOTFILES_DIR}/config/DankMaterialShell ${HOME}/.config/
