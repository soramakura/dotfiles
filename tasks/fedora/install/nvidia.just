[group("nvidia")]
nvidia-driver: _dnf::enable-rpm-fusion
    #!/bin/env bash
    set -euxo pipefail

    sudo dnf install \
        kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig \
        kmod-nvidia xorg-x11-drv-nvidia-cuda libva-nvidia-driver

    sleep 3
    while systemctl is-active --quiet "akmods.service" || [[ "$(systemctl show -p ActiveState --value akmods.service)" == "activating" ]]; do
        sleep 5
    done

    echo "LIBVA_DRIVER_NAME=nvidia" >> "/etc/environment"
    echo "NVD_BACKEND=direct" >> "/etc/environment"
    echo "GBM_BACKEND=nvidia-drm" >> "/etc/environment"
    echo "__GLX_VENDOR_LIBRARY_NAME=nvidia" >> "/etc/environment"

    echo -e "force_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" >> "/etc/dracut.conf.d/nvidia.conf"
    sudo dracut -f

    echo "Please reboot this machine!"
