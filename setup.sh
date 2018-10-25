# Create prx folder (some aliases will point to certain locations in here)
mkdir -p ~/prx

# VIM / NEOVIM
# Create a proxy .vimrc at the default location.
cp ./templates/.vimrc ~/.vimrc
# Create a proxy init.vim at the default location.
mkdir -p ~/.config/nvim && cp ./templates/init.vim ~/.config/nvim/init.vim
# Install all plugins
nvim +PlugInstall +qall

# ZSH
cp ./templates/.zshrc ~/.zshrc

# Set some useful git aliases
git config --global include.path ~/configs/templates/git_aliases
