#!/bin/bash -eu

readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../../")

mkdir -p ~/.config/

# Neovim
ln -snf ${DOTFILES_DIR}/config/nvim ~/.config/

# Helix
ln -snf ${DOTFILES_DIR}/config/helix ~/.config/

# tmux
ln -snf ${DOTFILES_DIR}/config/tmux ~/.config/
