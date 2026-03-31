#!/bin/bash -xeu

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install dependencies
source "${DOTFILES_DIR}/scripts/fedora/install_niri.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_power_profiles.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_foot.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_fonts.sh"

sudo dnf copr enable avengemedia/dms
sudo dnf install dms qt6ct-kde qt5ct nautilus

systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user add-wants niri.service dms

# Link the config files
ln -snf ${DOTFILES_DIR}/config/DankMaterialShell ${HOME}/.config/
