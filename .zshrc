# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit-dark"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias prx='cd ~/prx'
alias py='python'
alias npmg='npm list -g --depth=0'
alias npmlist='npm list --depth=0'
alias dossh='~/ssh.sh'
alias sup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias gitstat='git log --left-right --graph --cherry-pick --oneline HEAD...origin/master'

alias cdcfm='cd ~/prx/hanseaticsoft/cfm-cloud/CloudFleetManager/ReactApps'
alias cdhs='cd ~/prx/hanseaticsoft/cfm-react'

# Purge config files of already removed packages (handle with care)
alias thepurge='dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# JS Standard Style for linting
#export PATH=$PATH:/home/ryneke/.nvm/v6.10.0/bin/standard
# AirBnB Style
#export PATH=$PATH:/home/ryneke/.nvm/v6.10.0/bin/eslint
# Exercism CLI
export PATH="/opt:$PATH"
# Global npm packages (as per the current active nvm node version)
export PATH="(npm config --global get prefix):$PATH"

# Deactivate 'auto cd' functionality to be able to use ex. 'grunt'
unsetopt AUTO_CD

# Activate useful key bindings and fuzzy completion for fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix Tilix 'Configuration issue', as per
# https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
