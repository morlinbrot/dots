# Collect all necessary steps to get nvim to run properly in one place.

# Install following packages on whichever OS is being used.
# python3-dev python3-pip

# Python plugin host for nvim.
pip3 install pynvim

# Enable the fzf plugin in the .vimrc file:
# Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
# Plug 'junegunn/fzf.vim'

# Set the fzf's default command in .bashrc or .zshrc:
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/*" -g "!node_modules/*" -g "!target/*"'

# We need ripgrep to be able to use it with fzf.
# Default command can be set in .bashrc or .zshrc files.
cargo install ripgrep

