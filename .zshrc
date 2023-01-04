# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Include rustup autocompletions.
fpath+=~/.zfunc

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

export HISTCONTROL=ignoreboth

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  dirhistory
  git
  jsontools
  z
  zsh-autosuggestions
)

# Include oh-my-zsh config.
source $ZSH/oh-my-zsh.sh

# ++++ # ++++ #
#  ALIASES
# ++++ # ++++ #
# For a full list of active aliases, run `alias`.
alias prx='cd ~/prx'
alias py='python3'
alias npmg='npm list -g --depth=0'
alias npmlist='npm list --depth=0'
alias dossh='~/ssh.sh'
alias sup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias pac='sudo pacman -Syu'
# Set sound to more than 100%
alias loud='pactl set-sink-volume 1 150%'
# Clear swap
alias swap='sudo swapoff -a && sudo swapon -a'

# Specific/dependent aliases.
alias cdcfm='cd ~/prx/hanseaticsoft/cfm-cloud/CloudFleetManager/ReactApps'
alias cdalt='cd ~/prx/hanseaticsoft/cfm-cloud-ALT/CloudFleetManager/ReactApps'
alias cdhs='cd ~/prx/hanseaticsoft/cfm-cloud/ui/react-hs'

# Git aliases.
alias gcl='git clone'
alias gp='git pull'
alias gprb='git pull --rebase'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcod='git checkout dev'
alias gs='git status'
alias gd='git diff'
alias grs='git reset'
alias grsh='git reset --hard'
alias gst='git stash'
alias gstp='git stash pop'

alias gm='git merge'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'

alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gca='git commit -a'
alias gcaa='git commit --amend'

alias gpp='git push'

# Favourite 'git log' git aliases.
alias gls='git ls'
alias gla='git la'
alias glf='git lf'

# Handy exa shorts.
alias xl='exa -l'
alias xla='exa -la'
alias xlt='exa -lTL2'

# Rust!
alias cb='cargo build'
alias cc='cargo check'
alias cr='cargo run'
alias ct='cargo test'
alias cnt='cargo nextest run'

# What kind of pleb would write out 'nvim' all the time!?
alias nv='nvim'
alias v='nvim'
alias k='kak'
alias wiki='nvim -c VimwikiIndex'
alias config='nvim $HOME/.config/nvim/init.vim'

# terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# Just
alias j='just'
alias jb='just build'
alias jr='just run'
alias jt='just test'
alias jw='just watch'

# Default editor
export EDITOR="/opt/homebrew/bin/hx"

#  SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# FZF
# Use ripgrep for :Files
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!**/.git/*" -g "!**/node_modules/*" -g "!**/target/*" -g "!dotbot/*" -g "!**/.terraform/*"'

# ++++  ++++ #
#  PATH
# ++++  ++++ #
export PATH="/opt:$PATH"

# Various places where apps can be put.
export PATH="$HOME/.local/bin:$PATH"

# Add homebrew-installed llvm to the path.
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# Global npm packages (as per the current active nvm node version)
export PATH="(npm config get prefix --location=global):$PATH"

# GO
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# ++++  ++++ #
#  RANDOMS
# ++++  ++++ #
unsetopt AUTO_CD

# Source ghc and friends (Haskell)
if [ -d "~/.ghcup/env" ]; then
    . ~/.ghcup/env
fi

# STARSHIP cross-shell prompt
eval "$(starship init zsh)"
# auto-suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# KITTY
scroll-and-clear-screen() {
    printf '\n%.0s' {1..$LINES}
    zle clear-screen
}
zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

