#!/bin/bash -xe


sudo dnf install -y neovim python3-neovim

# Link the configuration files
readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

ln -snf ${DOTFILES_DIR}/config/nvim ~/.config/
