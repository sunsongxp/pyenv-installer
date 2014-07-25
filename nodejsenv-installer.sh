#!/bin/bash

# Author: 孙松
# Date: 12-29-2013
#
# README
# This script is used for installing necessary tools after new os has been setup. This script were tested under ubuntu 13.10.
# Step 1: run "chmod +x pyenv-installer.sh"
# Step 2: run "./nodejsenv-installer.sh", this needs sudo privilege. (do not use sh to run this script, it has problem with python virtualenv)
#

workspace="sourcecode"
mkdir ~/$workspace
cd ~/$workspace

# Inatall Node.js
git clone https://github.com/joyent/node.git
cd node
git checkout v0.10.28-release
./configure
make
sudo make install

# Install socket.io Haraka ungit
sudo npm install -g node-gyp # Required by Haraka
sudo npm install -g socket.io ungit Haraka express
sudo npm install -g node-static
sudo npm install -g forever
sudo npm install -g gitbook
sudo npm install -g weinre
