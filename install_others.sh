# Install oh-my-zsh
# This exits uncleanly when done
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Create symlink to Tilix's configuration issue fix
ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# RUST
curl https://sh.rustup.rs -sSf | sh
# Set up RLS for usage by vim plugins.
rustup component add rls rust-analysis rust-src rustfmt
bin/rust.sh

# rust-analyzer
git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
cargo xtask install

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# NEOVIM
# Must be installed beforehand
#pip3 install pynvim
#pip install pynvim
