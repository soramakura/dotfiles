[group("wm")]
xdg-desktop-portal:
    sudo dnf install \
        xdg-desktop-portal-gnome \
        xdg-desktop-portal-gtk

[group("wm")]
niri: xdg-desktop-portal pipewire ffmpeg libva-utils vulkan-tools gnome-keyring
    sudo dnf install niri --setopt=install_weak_deps=False

    ln -snf "{{justfile_directory()}}/config/niri" "{{config_directory()}}/"

[group("wm")]
dms: niri noto twemoji hackgen power-profiles-daemon nautilus
    #!/bin/env bash
    set -euxo pipefail

    sudo dnf copr enable avengemedia/dms

    sudo dnf install \
        dms qt6ct qt5ct qt6-qtmultimedia danksearch matugen cava cups-pk-helper wtype

    systemctl --user add-wants niri.service dms

    echo 'export QT_QPA_PLATFORMTHEME="qt5ct"' >> "{{home_directory()}}/.bash_profile"
    echo 'export XDG_DATA_DIR="/usr/local/share:/usr/share"' >> "{{home_directory()}}/.bash_profile"
    echo -e "
    if [ \"\$(gsettings get org.gnome.desktop.interface color-scheme)\" = \"'prefer-dark'\" ]; then
        export GTK_THEME=\"Adwaita:dark\"
    else
        export GTK_THEME=\"Adwaita\"
    fi
    gsettings set org.gnome.desktop.interface gtk-theme \"\$GTK_THEME\"
    " >> "{{home_directory()}}/.bash_profile"

    echo 'export XCURSOR_THEME=' >> "{{home_directory()}}/.bash_profile"
    echo 'export XCURSOR_SIZE=24' >> "{{home_directory()}}/.bash_profile"

    ln -snf "{{justfile_directory()}}/config/DankMaterialShell" "{{config_directory()}}/"

[group("wm")]
greetd:
    sudo dnf install greetd

[group("wm")]
dms_greeter: dms greetd
    dms greeter install
    dms greeter enable
    dms greeter sync
