# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Include Devbox's global env as the first thing.
# eval "$(devbox global shellenv)"

# Include `.zfunc` directory for autocompletions.
fpath+=~/.zfunc

# Not needed with antidote + use-omz: $ZSH is managed by use-omz, and the
# prompt comes from oh-my-posh, so no OMZ theme should be loaded.
# export ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="avit"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

export HISTCONTROL=ignoreboth

# Antidote plugin manager
# Currently exploring as better perf alternative to oh-my-zsh (omz slows down new shell startup from .12 to .56 ms)
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
source ${zsh_plugins}.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(
#   dirhistory
#   git
#   jsontools
#   z
#   zsh-autosuggestions
# )

# Include oh-my-zsh config.
# source $ZSH/oh-my-zsh.sh

# # Initialize oh-my-posh prompt.
_evalcache oh-my-posh init zsh --config ~/.config/oh-my-posh/default.omp.toml

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

alias gsup='git submodule update'
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
alias jc='just check'
alias jd='just dev'
alias ji='just install'
alias jf='just format'
alias jl='just lint'
alias jr='just run'
alias js='just serve'
alias jst='just start'
alias jt='just test'
alias jw='just watch'
alias jdc='just dc'
alias jdk='just dk'

alias d='deno'
alias dt='deno task'

alias notes='~/notes/notes.sh'

# Python
alias py='python3'
alias uvr='uv run'
alias uvt='uv run test'

# Docker Compose
alias dk='docker'
alias dkp='docker ps'
alias dka='docker ps -a'
# alias dkstop='docker stop $(docker ps -a -q)'
alias dc='docker compose'
alias dcp='docker compose ps'
alias dca='docker compose ps -a'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# Podman
alias pm='podman'
alias pc='podman compose'

# Kubernetes
alias kc='kubectl'

# Minikube
alias mk='minikube'
# Tauri
alias tauri='cargo tauri'
alias ct='cargo tauri'

# Moon monorepo management
alias mn='moon'

alias db='devbox'
alias dbs='devbox services'

# Mise
alias menv='eval "$(mise env -s zsh)"'

# Default editor
export EDITOR="/opt/homebrew/bin/hx"

#  SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# FZF
_evalcache fzf --zsh

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

# ++++  ++++ #
#  PATH
# ++++  ++++ #
export PATH="/opt:$PATH"

# Various places where apps can be put.
export PATH="$HOME/.local/bin:$PATH"

# Add homebrew-installed llvm to the path.
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# MISE. TODO: Consider replacing nvm with mise for node version handling.
# Using --shims to shave off startup time. Mise will not auto-load [env] sections when cd'ing into a dir. Use `menv` to load [env]s.
_evalcache mise activate zsh --shims

# NVM (kept after mise so nvm's node beats mise's node shims on PATH)
export NVM_DIR="$HOME/.nvm"
# Lazy load NVM on first use to avoid paying its huge startup time penalty
nvm() { unset -f nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm "$@"; }
# Put the default node version's bin (node, npm, and global npm packages) on
# PATH without loading nvm or npm: resolve the default alias with a glob.
if [[ -r $NVM_DIR/alias/default ]]; then
  _nvm_bins=($NVM_DIR/versions/node/$(<$NVM_DIR/alias/default)*/bin(Nn))
  (( $#_nvm_bins )) && export PATH="${_nvm_bins[-1]}:$PATH"
  unset _nvm_bins
fi

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
# pnpm
export PNPM_HOME="/Users/oxoliro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end



# Helper to time shell startup
timezsh () {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do
    /usr/bin/time $shell -i -c exit
  done
}

