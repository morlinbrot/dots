#!/bin/bash

# RUST
if [ ! -x "$(command -v rustup)" ]; then
    curl https://sh.rustup.rs -sSf | sh
fi

# Install favourite components.
rustup component add clippy rustfmt

# Adds commands like 'cargo add' for installing crates.
cargo install cargo-edit

# Shows a handy overview over outdated dependencies.
cargo install cargo-outdated

# A modern ls replacement written in Rust.
cargo install exa

# Blazingly fast grep replacement.
cargo install ripgrep

# Install wasm-pack
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh 

# Install rust-analyzer.
git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
cargo xtask install

