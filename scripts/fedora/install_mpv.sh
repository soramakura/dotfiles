#!/bin/bash -xe

sudo dnf install mpv

# Link the configuration files
DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

ln -snf ${DOTFILES_DIR}/config/mpv ~/.config/
