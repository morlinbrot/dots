# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit-dark"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
)

# Include oh-my-zsh config.
source $ZSH/oh-my-zsh.sh

# ++++ # ++++ #
#  ALIASES
# ++++ # ++++ #
# For a full list of active aliases, run `alias`.
alias prx='cd ~/prx'
alias py='python'
alias npmg='npm list -g --depth=0'
alias npmlist='npm list --depth=0'
alias dossh='~/ssh.sh'
alias sup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias gitstat='git log --left-right --graph --cherry-pick --oneline HEAD...origin/master'
# Purge config files of already removed packages (handle with care)
alias thepurge='dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge'

# Specific/dependent aliases
alias cdcfm='cd ~/prx/hanseaticsoft/cfm-cloud/CloudFleetManager/ReactApps'
alias cdhs='cd ~/prx/hanseaticsoft/cfm-react'

# ++++ # ++++ #
#  SSH
# ++++  ++++ #
export SSH_KEY_PATH="~/.ssh/rsa_id"

# ++++  ++++ #
#  RANDOMS
# ++++  ++++ #
# EXERCISM.io
export PATH="/opt:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# Global npm packages (as per the current active nvm node version)
export PATH="(npm config --global get prefix):$PATH"

# Fix 'Configuration issue', as per
# https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# ++++  ++++ #
#  TRASH ?
# ++++  ++++ #
# JS Standard Style for linting
#export PATH=$PATH:/home/ryneke/.nvm/v6.10.0/bin/standard
# AirBnB Style
#export PATH=$PATH:/home/ryneke/.nvm/v6.10.0/bin/eslint

# Deactivate 'auto cd' functionality to be able to use ex. 'grunt'
unsetopt AUTO_CD

# Activate useful key bindings and fuzzy completion for fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export MANPATH="/usr/local/man:$MANPATH"
