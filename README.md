# Einmal configs deluxe, bitte!
Various config files for shells, editors, etc.

The setup is currently focused on MacOS but should be applicable to other Unixes by replacing the Homebrew installation with the appropriate package manager.

The setup uses [dotbot](https://github.com/anishathalye/dotbot) to manage config files. Instead of copying files, symlinks are created so any changes done to a file here will take effect directly.

_The setup currently expects this repo to be cloned to `$HOME/dots`._

# Fresh Setup On A New System

Utilities to set up from scratch on a new system. Currently focused on MacOs.

## 1. Install Homebrew Apps

```
brew install $(<setup/brew-apps.txt)
```

Enable installing of nerd fonts via Homebrew.

```
brew tap homebrew/cask-fonts
```

VictorMono as an example:
```
brew install --cask font-victor-mono-nerd-font
```

## 2. Install Rust

Run [Rust's install script](https://www.rust-lang.org/tools/install)

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## 3. Install Cargo Apps

The current config wraps `cargo` with [sccache](https://crates.io/crates/sccache). If you have already run the `./install` script, you'll have to make sure to have sccache installed, e.g. already run the Homebrew installs.

Use xargs to install all programs at once:

```
xargs cargo install < brew/cargo-apps.txt
```

## 4. Oh-my-zsh
Install oh-my-zsh with:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

And the zsh-autosuggestions plugin:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

As well as the zsh-syntax-highlighting:
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# Dotbot for Config File Management

Simply run the script below to symlink the config files in this repo:

```
./install
```
