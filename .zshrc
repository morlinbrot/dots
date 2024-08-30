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
  zsh-syntax-highlighting
)

# Include oh-my-zsh config.
source $ZSH/oh-my-zsh.sh

# Initialize oh-my-posh prompt.
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/default.omp.toml)"

# ++++ # ++++ #
#  ALIASES
# ++++ # ++++ #
# For a full list of active aliases, run `alias`.
alias prx='cd ~/prx'
alias py='python3'
alias npmg='npm list -g --depth=0'

# Git aliases.
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'

alias gbl='git blame -w'

alias gbr='git branch --remote'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcod='git checkout dev'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gcl='git clone --recurse-submodules'

alias gc='git commit -v'
alias gca='git commit -v --all'
alias gcam='git commit --all --message'
alias gcm='git commit --message'
alias gc!='git commit -v --amend'
alias gcn!='git commit --amend --no-edit'
alias gcan!='git commit --all --amend --no-edit'

alias gd='git diff'

alias gf='git fetch'
alias gfa='git fetch --all --prune --jobs=10'

alias glg='git log --stat'
alias glgp='git log --stat --patch'
alias gls='git log --graph --pretty="%C(auto)%h%Creset%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glsa='git log --graph --pretty="%C(auto)%h%Creset%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glsd='git log --graph --pretty="%C(auto)%h%Creset%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'

alias gm='git merge'
alias gma='git merge --abort'
alias gms="git merge --squash"

alias gp='git pull'
alias gpr='git pull --rebase'
alias gprb='git pull --rebase'
alias gpra='git pull --rebase --autostash'
alias gprba='git pull --rebase --autostash'

alias gpp='git push'
alias gpp!='git push --force'
alias gppu='git push -u origin'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'

alias gr='git remote'
alias grv='git remote --verbose'
alias grsu='git remote set-url'

alias grs='git reset'
alias grsh='git reset --hard'

alias grm='git rm'
alias grmc='git rm --cached'

alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstu='git stash --include-untracked'

alias gs='git status'

alias gsw='git switch'
alias gswc='git switch --create'

# Handy exa shorts.
alias xla='exa -la'
alias xlt='exa -lTL2'

# Rust!
alias c='cargo'
alias cb='cargo build'
alias cch='cargo check' # `cc` interferes with the linker of the same name
alias cr='cargo run'
alias ct='cargo test'
alias cnt='cargo nextest run'
alias cw='cargo watch'

# What kind of pleb would write out 'nvim' all the time!?
alias nv='nvim'
alias v='nvim'

# terraform
alias tf='terraform'

# Just
alias j='just'
alias jb='just build'
alias jr='just run'
alias jt='just test'
alias jw='just watch'
alias js='just serve'
alias jl='just lint'

# Default editor
export EDITOR="/opt/homebrew/bin/hx"

#  SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# FZF
# Use ripgrep for :Files
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!**/.git/*" -g "!**/node_modules/*" -g "!**/target/*" -g "!dotbot/*" -g "!**/.terraform/*"'

# Use fd instead of find for fzf.
export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --stript-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--bind=space:toggle,ctrl-l:select,ctrl-h:deselect,ctrl-x:deselect-all"

# Use fd for path completions candidates.
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

# Use fd for directory completion.
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

eval "$(fzf --zsh)"

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

# auto-suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# KITTY
scroll-and-clear-screen() {
    printf '\n%.0s' {1..$LINES}
    zle clear-screen
}
zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

# BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# .NET CORE SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools/:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/"
