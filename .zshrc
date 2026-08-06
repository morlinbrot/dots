# Include `.zfunc` directory for autocompletions.
fpath+=~/.zfunc

HYPHEN_INSENSITIVE="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

setopt HIST_IGNORE_ALL_DUPS
unsetopt AUTO_CD

# Default editor
export EDITOR="/opt/homebrew/bin/hx"

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Antidote plugin manager
# Currently exploring as better perf alternative to oh-my-zsh (omz slows down new shell startup from .12 to .56 ms)
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
source ${zsh_plugins}.zsh

# Initialize oh-my-posh prompt.
_evalcache oh-my-posh init zsh --config ~/.config/oh-my-posh/default.omp.toml

# ++++ # ++++ #
#  ALIASES
# ++++ # ++++ #
alias prx='cd ~/prx'
alias py='python3'
alias npmg='npm list -g --depth=0'

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

alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstu='git stash --include-untracked'
alias gsup='git submodule update'
alias gsw='git switch'
alias gswc='git switch --create'

alias xla='exa -la'
alias xlt='exa -lTL2'

alias c='cargo'
alias cb='cargo build'
alias cch='cargo check' # `cc` interferes with the linker of the same name
alias cr='cargo run'
alias ct='cargo test'
alias cnt='cargo nextest run'
alias cw='cargo watch'

alias tauri='cargo tauri'
alias ct='cargo tauri'

# What kind of pleb would write out 'nvim' all the time!?
alias nv='nvim'
alias v='nvim'

alias tf='terraform'

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
alias jwr='just watch-run'
alias jwt='just watch-test'

alias d='deno'
alias dt='deno task'
alias dtd='deno task dev'
alias dtb='deno task build'
alias dts='deno task serve'
alias dtp='deno task preview'
alias dtt='deno task test'

alias notes='~/notes/notes.sh'

alias py='python3'
alias uvr='uv run'
alias uvt='uv run test'

alias dk='docker'
alias dkp='docker ps'
alias dka='docker ps -a'
# alias dkstop='docker stop $(docker ps -a -q)'
alias dc='docker compose'
alias dcp='docker compose ps'
alias dca='docker compose ps -a'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

alias pm='podman'
alias pc='podman compose'

alias k='kubectl'
alias kg='kubectl get'
alias kci='kubectl cluster-info'
alias kpf='kubectl port-forward'

alias mk='minikube'

alias mn='moon'

alias db='devbox'
alias dbs='devbox services'

alias m='mise'
alias mr='mise run'
alias mt='mise tasks'
alias menv='eval "$(mise env -s zsh)"'

# FZF
_evalcache fzf --zsh

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

# GO
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

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

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# .NET CORE SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools/:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/"

# DENO
. "$HOME/.deno/env"

# KUBECTL completions
source <(kubectl completion zsh)

# Helper to time shell startup
timezsh () {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do
    /usr/bin/time $shell -i -c exit
  done
}

