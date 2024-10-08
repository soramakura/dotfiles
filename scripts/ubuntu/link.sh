#!/bin/bash -eu

UBUNTU_SCRIPTS_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})")
DOTFILES_DIR=$(readlink -f $(dirname $(dirname ${UBUNTU_SCRIPTS_DIR})))
echo $UBUNTU_SCRIPTS_DIR
echo $DOTFILES_DIR
cd ${DOTFILES_DIR}

# Git
ln -snf ${DOTFILES_DIR}/git/.gitconfig ~/

# Helix
mkdir -p ~/.config
ln -snf ${DOTFILES_DIR}/helix ~/.config/

# Neovim
mkdir -p ~/.config
ln -snf ${DOTFILES_DIR}/nvim ~/.config/

# tmux
mkdir -p ~/.config
ln -snf ${DOTFILES_DIR}/tmux ~/.config/
