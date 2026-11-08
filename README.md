# Einmal configs deluxe, bitte!
Various config files for shells, editors, etc.

Works on macOS and Linux. Packages come from [Homebrew](https://brew.sh) on both, and config files are symlinked into place with [dotbot](https://github.com/anishathalye/dotbot), so any change to a file here takes effect directly.

_The setup expects this repo to be cloned to `$HOME/dots`._

# Fresh Setup On A New System

```sh
git clone --recurse-submodules https://github.com/morlinbrot/dots.git ~/dots
~/dots/bootstrap.sh          # full setup on macOS, CLI setup on Linux
~/dots/bootstrap.sh cli      # or pick a profile explicitly: cli | full
```

`bootstrap.sh` installs Homebrew (plus its build dependencies on Debian/Ubuntu), the Rust toolchain via rustup, all packages from the profile's Brewfile, links the configs with dotbot and makes zsh the login shell. It's safe to re-run.

| Profile | Brewfile | For |
|---|---|---|
| `cli` | [`setup/Brewfile.cli`](setup/Brewfile.cli) | Shell, editors and CLI essentials. Remote boxes. |
| `full` | [`setup/Brewfile`](setup/Brewfile) | Everything on the laptop: includes `Brewfile.cli`, plus apps, fonts and dev tooling. |

## Adding or removing packages

Edit the Brewfile, then `brew bundle --file=setup/Brewfile`. Tools not packaged by Homebrew can go in as `cargo "<crate>"` entries (installed with `cargo install --locked`).

To see what's installed but not listed: `brew bundle cleanup --file=setup/Brewfile` (add `--force` to uninstall it).

## Rust

Rust is installed via Homebrew's `rustup`, so it's the same on every machine. If a Brewfile lists `rustup`, `bootstrap.sh` also sets up the stable toolchain with clippy, rustfmt and rust-analyzer. Remove `rustup` from `Brewfile.cli` to skip Rust on a box.

Rust builds are cached with [sccache](https://github.com/mozilla/sccache) when it's installed: `.zprofile` sets `RUSTC_WRAPPER=sccache`. It isn't set in `cargo.config.toml`, because cargo fails wherever a wrapper set there is missing.

# Config files

Re-link after adding new files to `dotbot.default.yaml`:

```sh
./install
```

- **zsh:** `.zprofile` sets up PATH (Homebrew, rustup, cargo) for login shells, `.zshrc` does the interactive setup. Tools that aren't installed are skipped. Machine-specific settings and secrets go in `~/.zshrc.local`, which isn't tracked.
- **Neovim:** `nvim/`, using [lazy.nvim](https://github.com/folke/lazy.nvim), which installs itself and all plugins on first start. Language servers come from Homebrew or rustup.
- **Helix:** `helix/`.
