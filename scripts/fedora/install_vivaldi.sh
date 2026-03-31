#!/bin/bash -xe

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install video codec
source ${DOTFILES_DIR}/scripts/fedora/install_video_codec.sh

sudo dnf config-manager addrepo --from-repofile=https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf install vivaldi-stable

# Link logo files
sudo ln -s /opt/vivaldi/product_logo_256.png /usr/share/icons/hicolor/256x256/apps/vivaldi.png
sudo ln -s /opt/vivaldi/product_logo_128.png /usr/share/icons/hicolor/128x128/apps/vivaldi.png
sudo ln -s /opt/vivaldi/product_logo_64.png /usr/share/icons/hicolor/64x64/apps/vivaldi.png
sudo ln -s /opt/vivaldi/product_logo_48.png /usr/share/icons/hicolor/48x48/apps/vivaldi.png
sudo ln -s /opt/vivaldi/product_logo_32.png /usr/share/icons/hicolor/32x32/apps/vivaldi.png
sudo ln -s /opt/vivaldi/product_logo_16.png /usr/share/icons/hicolor/16x16/apps/vivaldi.png

sudo gtk-update-icon-cache /usr/share/icons/hicolor
