# Einmal configs deluxe, bitte!
Various config files for shells, editors, etc.

On a fresh (unix) system, run scripts in `system-setup` for installation of the most important programs.

Run `./install` to execute automatic config setup provided by [dotbot](https://github.com/anishathalye/dotbot).
Run `setup.sh` to setup some additional plugins like oh-my-zsh etc.

# Current Status
- Complete migration to lua config for nvim. Auto-completion not working.
- Make initial installation cross-platform with a tool like ansible.
- Integrate `setup.sh` into some automatic setup.
- Remove `templates` folder.

# Usage
## Cargo apps
Make sure to have sccache installed:
```
brew install sccache
```
Install all the cargo apps in one go:
```
cat ./setup/cargo-apps.txt | xargs cargo install
```

# Notes
### nvm
Required packages.
`python3-dev python3-pip`

Python plugin host for nvim.
`pip3 install pynvim`

### fzf
Enable the fzf plugin in the .vimrc file:
```
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
```

Set the fzf's default command in .bashrc or .zshrc:
```
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/*" -g "!node_modules/*" -g "!target/*"'
```
We need ripgrep to be able to use it with fzf.
```
cargo install ripgrep
```

### Fish shell + nvm
Some plugins might need the currently active node binary (e.g. coc.nvim)
https://github.com/FabioAntunes/fish-nvm#how-it-works

Manual steps to make the binary available:
```
touch /usr/local/bin/node
```

Paste content:
```
#! /usr/bin/env fish
__nvm_run "node" $argv
```

Make executable.
```
chmod +x /usr/local/bin/node
```
