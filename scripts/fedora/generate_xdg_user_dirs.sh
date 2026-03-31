#!/bin/bash -xeu

sudo dnf install xdg-user-dirs

LANG=C xdg-user-dirs-update

# Link the config files
DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")
