#!/bin/bash -xeu

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

sudo dnf install power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon
