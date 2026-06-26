[group("container")]
podman:
    sudo dnf install podman

[group("container")]
distrobox: podman
    sudo dnf install distrobox
