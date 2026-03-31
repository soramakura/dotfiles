#!/bin/bash -xe

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install video codec
source ${DOTFILES_DIR}/scripts/fedora/install_video_codec.sh

# VLC
sudo dnf install vlc
