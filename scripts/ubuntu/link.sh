#!/bin/bash -eu

echo $DOTFILES_DIR
cd ${DOTFILES_DIR}

# Git
ln -snf ${DOTFILES_DIR}/config/git/.gitconfig ~/

# Helix
mkdir -p ~/.config
ln -snf ${DOTFILES_DIR}/config/helix ~/.config/

# Neovim
mkdir -p ~/.config
ln -snf ${DOTFILES_DIR}/config/nvim ~/.config/

# tmux
mkdir -p ~/.config
ln -snf ${DOTFILES_DIR}/config/tmux ~/.config/
