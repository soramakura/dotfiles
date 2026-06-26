[group("for-config")]
xdg-user-dirs:
    sudo dnf install xdg-user-dirs

    LANG=C xdg-user-dirs-update

[group("for-config")]
crudini:
    sudo dnf install -y crudini
