# Work in progress for a one-stop-set-up-Rust-env-script.
rustup update
# Adds commands like 'cargo add' for installing crates.
cargo install cargo-edit
# Shows a handy overview over outdated dependencies.
cargo install cargo-outdated
# Shows a tree of dependencies. Esp. useful for the cargo tree -d command,
# showing duplicate deps and which crates depend on them.
cargo install cargo-tree
