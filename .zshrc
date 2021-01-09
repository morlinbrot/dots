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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  z
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
alias loud='pactl set-sink-volume 0 150%'
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

# What kind of pleb would write out 'nvim' all the time!?
alias nv='nvim'
alias v='nvim'
alias k='kak'

#  SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# FZF
# Use ripgrep for :Files
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/*" -g "!node_modules/*" -g "!target/*"'

# ++++  ++++ #
#  RANDOMS
# ++++  ++++ #
export PATH="/opt:$PATH"

# Source ghc and friends (Haskell)
if [ -d "~/.ghcup/env" ]; then
    . ~/.ghcup/env
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# Global npm packages (as per the current active nvm node version)
export PATH="(npm config --global get prefix):$PATH"

# ++++  ++++ #
#  TRASH ?
# ++++  ++++ #
# Activate useful key bindings and fuzzy completion for fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

