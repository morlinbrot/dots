# Create prx folder (some aliases will point to certain locations in here)
mkdir -p ~/prx

# VIM / NEOVIM
# Create a proxy .vimrc at the default location.
cp ./templates/.vimrc ~/.vimrc
# Create a proxy init.vim at the default location.
mkdir -p ~/.config/nvim && cp ./templates/init.vim ~/.config/nvim/init.vim
# Install all plugins
vim +PlugInstall +qall

# ZSH
cp ./templates/.zshrc ~/.zshrc

# Append git aliases to the default .gitconfig
cat ./templates/git-aliases >> ~/.gitconfig
