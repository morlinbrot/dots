# Login shell setup. Runs once per login (new terminal windows, SSH sessions), before .zshrc.
# Anything that only needs to set up the environment (PATH etc.) goes here.

typeset -U path # Keep PATH entries unique.

# Homebrew (macOS: /opt/homebrew, Linux: /home/linuxbrew/.linuxbrew)
for _brew in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  [[ -x $_brew ]] && eval "$($_brew shellenv)" && break
done
unset _brew

# Rust: Homebrew's rustup is keg-only, so put it on PATH ourselves.
# Binaries from `cargo install` live in ~/.cargo/bin (after Homebrew, so brew-installed tools win).
[[ -n $HOMEBREW_PREFIX && -d $HOMEBREW_PREFIX/opt/rustup/bin ]] && path=($HOMEBREW_PREFIX/opt/rustup/bin $path)
path+=(~/.cargo/bin)

# Cache Rust builds with sccache, when it's installed.
(( $+commands[sccache] )) && export RUSTC_WRAPPER=sccache

# OrbStack: command-line tools and integration
[[ -r ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh
