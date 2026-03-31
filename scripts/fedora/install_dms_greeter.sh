#!/bin/bash -xeu

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install dependencies
source "${DOTFILES_DIR}/scripts/fedora/install_dms.sh"

sudo dnf install greetd
dms greeter install

dms greeter enable
dms greeter sync
