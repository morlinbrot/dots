#!/usr/bin/env bash

# RUST
if [ ! -x "$(command -v rustup)" ]; then
    curl https://sh.rustup.rs -sSf | sh
fi

# Install favourite components.
rustup component add clippy rustfmt

cargo install bat cargo-edit exa ripgrep wasm-pack

# Install rust-analyzer.
git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
cargo xtask install

