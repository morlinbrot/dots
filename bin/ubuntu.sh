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