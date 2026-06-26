[group("rust")]
rust-fullset: rust rust-update rust-cache rust-license rust-deps

[group("rust")]
rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "{{home_directory()}}/.cargo/env"

    rustup component add rust-analyzer
    rustup component add rustfmt

[group("rust")]
rust-update: rust
    sudo dnf install openssl-devel
    cargo install cargo-update

[group("rust")]
rust-cache: 
    cargo install cargo-cache
    cargo install cargo-sweep

[group("rust")]
rust-license: 
    cargo install cargo-license
    cargo install cargo-bundle-licenses

[group("rust")]
rust-deps: 
    cargo install cargo-tree

