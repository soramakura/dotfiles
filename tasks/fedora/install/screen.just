[group("screen")]
brightnessctl:
    sudo dnf install brightnessctl

[group("screen")]
ddcutil:
    sudo dnf install ddcutil
    sudo modprobe i2c-dev

[group("screen")]
i2c-tools:
    sudo dnf install i2c-tools
