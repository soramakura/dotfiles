#!/bin/bash -xe

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install Fctix5
sudo dnf install fcitx5 fcitx5-configtool fcitx5-autostart fcitx5-mozc

ln -snf "${DOTFILES_DIR}/config/fcitx5" "${HOME}/.config/"
