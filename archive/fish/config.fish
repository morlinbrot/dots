# NOTES
# Most important difference to other shells: Environment variables.
# https://fishshell.com/docs/current/cmds/set.html
# https://stackoverflow.com/questions/25632846/how-to-set-environment-variables-in-fish-shell
#
# Add something to $PATH via command line (universal variable + export):
# set -Ux fish_user_paths /my/custom/path/bin $fish_user_paths
# 
# Kept here FOR REFERENCE: (Env vars do not need to be set in a config file on each startup
# but just once via the appropriate commands.)
#
# Fzf default command, used in nvim, too.
# set -Ux FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!.git/*" -g "!node_modules/*" -g "!target/*"'
#
# Global npm packages (as per the current active nvm node version)
# set -Ux fish_user_paths $fish_user_paths "(npm config --global get prefix)"

# Spacefish prompt
set SPACEFISH_PROMPT_ORDER time user dir host node docker ruby golang php rust haskell julia git aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char
set SPACEFISH_DIR_COLOR 8be9fd
set SPACEFISH_RUST_COLOR 808080
set SPACEFISH_NODE_COLOR 808080
set SPACEFISH_GIT_BRANCH_COLOR bd93f9

# Don't show a greeting message
set fish_greeting

# Setup NVM
load_nvm

alias prx="cd ~/prx"
alias py="python3"
alias npmg="npm list -g --depth=0"
alias npmlist="npm list --depth=0"
alias dossh="~/ssh.sh"
alias sup="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias pac="sudo pacman -Syu"
# Set sound to more than 100%
alias loud="pactl set-sink-volume 1 150%"
alias louder=loud
# Clear swap
alias swap="sudo swapoff -a && sudo swapon -a"

# Specific/dependent aliases.
alias cdcfm="cd ~/prx/hanseaticsoft/cfm-cloud/CloudFleetManager/ReactApps"
alias cdalt="cd ~/prx/hanseaticsoft/cfm-cloud-ALT/CloudFleetManager/ReactApps"
alias cdhs="cd ~/prx/hanseaticsoft/cfm-cloud/ui/react-hs"

# Git aliases.
alias gcl="git clone"
alias gp="git pull"
alias gprb="git pull --rebase"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcod="git checkout dev"
alias gs="git status"
alias gd="git diff"
alias grs="git reset"
alias grsh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"

alias gm="git merge"
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias gcpa="git cherry-pick --abort"

alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"

alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gca="git commit -a"
alias gcaa="git commit --amend"

alias gpp="git push"

# Favourite "git log" git aliases.
alias gls="git ls"
alias gla="git la"
alias glf="git lf"

# Handy exa shorts.
alias xl="exa -l"
alias xla="exa -la"
alias xlt="exa -lTL2"

# Rust!
alias cb="cargo build"
alias cc="cargo check"
alias cr="cargo run"
alias ct="cargo test"

# What kind of pleb would write out "nvim" all the time!?
alias nv="nvim"
alias v="nvim"
alias k="kak"
alias wiki="nvim -c VimwikiIndex"

