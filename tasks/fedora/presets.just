set shell := ["bash", "-euo", "pipefail", "-c"]

help:
    @just --list fedora presets

[group("cli")]
cli-dev-env: \
        _dnf::my-dnf-config \
        _network::enable-privacy-dns _network::enable-ipv6-temp-addr \
        _install::c-development _install::clang _install::rust-fullset\
        _install::fd-find _install::ripgrep _install::fzf \
        _install::nmtui _install::btop \
        _install::neovim _install::tmux \

[group("everything")]
base-setup: \
        _dnf::my-dnf-config _dnf::enable-rpm-fusion 
        _network::enable-ipv6-temp-addr _network::enable-privacy-dns \
        _install::xdg-user-dirs \
        _install::git _install::github-cli _install::lazygit \
        _install::c_development _install::clang \
        _install::rust-fullset \
        _install::neovim _install::tmux \
        _install::fd-find _install::ripgrep _install::fzf _install::bat \
        _install::ps_mem _install::btop _install::nmtui \
        _install::yt-dlp _install::fastfetch \
        _install::distrobox _install::podman \
        _install::gnome-keyring \
        _install::noto _install::twemoji _install::hackgen \
        _install::ffmpeg _install::libavcodec _install::libva-utils _install::pipewire _install::vulkantools \
        _install::niri _install::dms _install::dms_greeter _install:xdg_desktop-portal \
        _install::foot \
        _install::ddcutil _install::i2c-utils _install::power-profiles-daemon
        _install::alsamixer _install::wiremix _install::imv _install::mpv _install::strawberry \
        _install::nautilus _install::thunar \
        _install::fcitx5 \
        _install::syncthing \
        _install::vivaldi-native \

[group("machine")]
monolith: base-setup _install::nvidia-driver

[private]
mod _install "./install.just"

[private]
mod _dnf "./dnf.just"

[private]
mod _network "./network.just"
