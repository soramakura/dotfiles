#!/bin/bash -xe

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Setup Flatpak
source ${DOTFILES_DIR}/scripts/fedora/enable_flatpak.sh

flatpak install flathub com.vivaldi.Vivaldi
