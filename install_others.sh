# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Create symlink to Tilix's configuration issue fix
ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# RUST
curl https://sh.rustup.rs -sSf | sh
# Set up RLS for usage by vim plugins.
rustup component add rls rust-analysis rust-src rustfmt
bin/rust.sh

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# NEOVIM
# Plugin dependencies.
pip3 install pynvim
pip install pynvim
