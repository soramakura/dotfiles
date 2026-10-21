#!/bin/bash -xeu

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Install dependencies
source "${DOTFILES_DIR}/scripts/fedora/install_niri.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_power_profiles.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_foot.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_fonts.sh"
source "${DOTFILES_DIR}/scripts/fedora/install_media_codec.sh"
source "${DOTFIELS_DIR}/scripts/fedora/install_dfiles.sh"
source "${DOTFILES_DIR}/scripts/fedora/enable_flatpak.sh"

sudo dnf copr enable avengemedia/dms
sudo dnf copr enable duxlabs/dux

sudo dnf install quickshell dms qt6ct-kde qt5ct cliphist wtype

systemctl --user add-wants niri.service dms

mkdir -p "${HOME}/.config/environment.d/"
echo 'export QT_QPA_PLATFORMTHEME="qt5ct"' >> "${HOME}/.config/environment.d/90-dms.conf"
echo 'export GTK_THEME="Adwaita:dark"' >> "${HOME}/.config/environment.d/90-dms.conf"
echo 'export XDG_DATA_DIR="/usr/local/share:/usr/share"' >> "${HOME}/.config/environment.d/90-dms.conf"
echo 'export XCURSOR_THEME=' >> "${HOME}/.config/environment.d/90-dms.conf"
echo 'export XCURSOR_SIZE=24' >> "${HOME}/.config/environment.d/90-dms.conf"

echo 'export XDG_DATA_DIR="/usr/local/share:/usr/share"' >> "${HOME}/.bash_profile"
echo 'export XCURSOR_THEME=' >> "${HOME}/.bash_profile"
echo 'export XCURSOR_SIZE=24' >> "${HOME}/.bash_profile"

# Link the config files
ln -snf ${DOTFILES_DIR}/config/dms ${HOME}/.config/
