[group("power-profiles")]
power-profiles-daemon:
    sudo dnf install power-profiles-daemon

    sudo systemctl enable --now power-profiles-daemon
