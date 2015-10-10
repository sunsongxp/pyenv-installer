#!/bin/bash

# Author: 孙松
# Date: 12-29-2013
#
# README
# This script is used for installing necessary tools after new os has been setup. This script were tested under ubuntu 13.10.
# Step 1: run "chmod +x pyenv-installer.sh"
# Step 2: run "./nodejsenv-installer.sh", this needs sudo privilege. (do not use sh to run this script, it has problem with python virtualenv)
#

# Install nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash

# Install Node (I have problem running this command because it requires terminal restarted)
nvm install 0.10

# Install useful software and libraries
npm install -g node-gyp # Required by Haraka
npm install -g socket.io ungit Haraka express
npm install -g node-static
npm install -g forever
npm install -g gitbook
npm install -g weinre

# git-stats
npm install -g git-stats-importer
npm install -g git-stats
wget -qO- https://raw.githubusercontent.com/IonicaBizau/git-stats/master/scripts/init-git-post-commit | bash
