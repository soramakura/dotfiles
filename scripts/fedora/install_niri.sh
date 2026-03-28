#!/bin/bash -xeu

# Install niri with dms
sudo dnf copr enable avengemedia/dms
sudo dnf install niri dms
systemctl --user add-wants niri.service dms

# Link the config files
readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

echo $DOTFILES_DIR

ln -snf ${DOTFILES_DIR}/config/niri ${HOME}/.config/niri
