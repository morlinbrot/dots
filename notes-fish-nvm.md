
# Some plugins might need the currently active node binary (e.g. coc.nvim)
https://github.com/FabioAntunes/fish-nvm#how-it-works

Manual steps to make the binary available:
```
touch /usr/local/bin/node

```
Paste

```
#! /usr/bin/env fish

__nvm_run "node" $argv
```
Make executable

```
chmod +x /usr/local/bin/node
```
