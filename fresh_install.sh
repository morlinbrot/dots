# SYNCTHING
# Add keys.
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Add the "stable" channel. 
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Add syncthing-gtk ppa
sudo add-apt-repository ppa:nilarimogard/webupd8
# syncthing syncthing-gtk

# NEOVIM
sudo add-apt-repository ppa:neovim-ppa/stable
# python-dev python-pip python3-dev python3-pip

sudo apt update
sudo apt install 

# Install everything after updating the sources.
sudo apt install curl git neovim zsh tilix tmux python-dev python-pip python3-dev python3-pip syncthing syncthing-gtk


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Create symlink to Tilix's configuration issue fix
ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# RUST
curl https://sh.rustup.rs -sSf | sh
# Set up RLS for usage by vim plugins.
rustup component add rls rust-analysis rust-src rustfmt

# NEOVIM
# Plugin dependencies.
pip3 install pynvim
pip install pynvim

