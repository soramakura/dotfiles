#!/bin/bash -xe

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
rustup component add rustfmt

# For updating apps installed by cargo
cargo install cargo-update

# For cleaning cargo cache
cargo install cargo-cache
cargo install cargo-sweep

# For checking licenses
cargo install cargo-license
cargo install cargo-bundle-licenses

# For checking dependencies
cargo install cargo-tree

# For nvim-treesitter
cargo install tree-sitter-cli
