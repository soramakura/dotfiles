help:
    @just --list fedora package

enable-rpm-fusion:
    sudo dnf install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

my-dnf-config: _install::crudini
    sudo crudini --set /etc/dnf/dnf.conf main max_parallel_downloads 10
    sudo crudini --set /etc/dnf/dnf.conf main clean_requirements_on_remove True
    sudo crudini --set /etc/dnf/dnf.conf main installonly_limit True

    sudo dnf clean all
    sudo dnf makecache
    sudo dnf autoremove

[private]
mod _install "./install/for-config.just"
