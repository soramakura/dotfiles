#!/bin/bash -xeu

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

sudo dnf copr enable duxlabs/dux
sudo dnf install quickshell dux-files

dfiles portal install

ln -snf ${DOTFILES_DIR}/config/dfiles ${HOME}/.config/
