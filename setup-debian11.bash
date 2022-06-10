#!/bin/bash

# change timezone
sudo ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install develop tool
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install -y git fish awscli zoxide fzf ripgrep

# docker install
# @see https://matsuand.github.io/docs.docker.jp.onthefly/engine/install/debian/#install-using-the-repository
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# add user to docker
sudo groupadd docker
sudo usermod -g docker $USER
sudo /bin/systemctl restart docker.service

# mkdir
mkdir -p $HOME/develop/src/github.com/grandcolline
mkdir -p $HOME/develop/pkg
mkdir -p $HOME/develop/bin
mkdir -p $HOME/.config

# install neovim
curl -L https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz >$HOME/develop/tool/nvim-linux64.tar.gz
tar xzvf $HOME/develop/tool/nvim-linux64.tar.gz
ln -vsfn $HOME/develop/tool/nvim-linux64/bin/nvim $HOME/develop/tool/nvim

# dotfile
git clone https://github.com/grandcolline/dotfiles.git $HOME/develop/src/github.com/grandcolline/dotfiles
XDG_CONFIG_HOME=$HOME/.config $HOME/develop/src/github.com/grandcolline/dotfiles/setup.sh
