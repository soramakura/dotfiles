#!/bin/bash -xeu

# Install niri with dms
sudo dnf copr enable avengemedia/dms
sudo dnf install niri dms
systemctl --user add-wants niri.service dms

# Link the config files
echo $DOTFILES_DIR
cd ${DOTFILES_DIR}

ln -snf ${DOTFILES_DIR}/config/niri ${HOME}/.config/niri
