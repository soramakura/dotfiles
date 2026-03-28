#!/bin/bash -xe

sudo dnf install -y tmux

# Link the configuration files
DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

ln -snf ${DOTFILES_DIR}/config/tmux ~/.config/
