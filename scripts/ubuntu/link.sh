#!/bin/bash -eu

UBUNTU_SCRIPTS_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})")
DOTFILES_DIR=$(readlink -f $(dirname $(dirname ${UBUNTU_SCRIPTS_DIR})))
echo $UBUNTU_SCRIPTS_DIR
echo $DOTFILES_DIR
cd ${DOTFILES_DIR}

# Helix
mkdir -p ~/.config/helix
ln -snf ${DOTFILES_DIR}/helix ~/.config/helix
