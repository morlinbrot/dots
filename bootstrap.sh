#!/usr/bin/env bash
# One-command setup for a fresh machine.
#
#   git clone --recurse-submodules https://github.com/morlinbrot/dots.git ~/dots
#   ~/dots/bootstrap.sh [cli|full]
#
# Profiles (default: full on macOS, cli on Linux):
#   cli   setup/Brewfile.cli: shell, editors and CLI essentials (remote boxes)
#   full  setup/Brewfile: everything on the laptop
#
# Safe to re-run: every step skips what's already done.

set -euo pipefail

DOTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"

if [[ $# -gt 0 ]]; then
  profile="$1"
elif [[ $OS == Darwin ]]; then
  profile=full
else
  profile=cli
fi

case "$profile" in
  cli) brewfile="$DOTS/setup/Brewfile.cli" ;;
  full) brewfile="$DOTS/setup/Brewfile" ;;
  *) echo "Usage: $0 [cli|full]" >&2; exit 1 ;;
esac

step() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }

# 1. System packages Homebrew itself needs on Linux (plus zsh, which `chsh` wants from /etc/shells).
if [[ $OS == Linux ]] && command -v apt-get >/dev/null; then
  step "Installing system packages (apt)"
  sudo apt-get update
  sudo apt-get install -y build-essential procps curl file git zsh
fi

# 2. Homebrew
if ! command -v brew >/dev/null; then
  for b in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    [[ -x $b ]] && eval "$("$b" shellenv)" && break
  done
fi
if ! command -v brew >/dev/null; then
  step "Installing Homebrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  for b in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    [[ -x $b ]] && eval "$("$b" shellenv)" && break
  done
fi

# 3. Rust toolchain, if the Brewfile asks for rustup. Must exist before `cargo` entries install.
if brew bundle list --formula --file="$brewfile" | grep -qx rustup; then
  step "Setting up Rust"
  brew list rustup >/dev/null 2>&1 || brew install rustup
  export PATH="$(brew --prefix rustup)/bin:$HOME/.cargo/bin:$PATH"
  rustup default >/dev/null 2>&1 || rustup default stable
  rustup component add clippy rustfmt rust-analyzer
fi

# 4. Packages
step "Installing packages from ${brewfile#"$DOTS"/}"
brew bundle --file="$brewfile"

# 5. Config symlinks (dotbot)
step "Linking config files"
"$DOTS/install"

# 6. zsh as login shell
if [[ "$(basename "${SHELL:-}")" != zsh ]]; then
  step "Making zsh the default shell"
  zsh_path="$(grep -m1 '/zsh$' /etc/shells)"
  chsh -s "$zsh_path"
fi

step "Done. Open a new shell (or log in again) to pick everything up."
