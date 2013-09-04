#!/bin/bash

# Author: 孙松
# Date: 08-31-2013
#
# README
# This script is used for installing necessary tools after new os has been setup. This script were tested under ubuntu 13.10.
# Step 1: run "chmod +x pyenv-installer.sh"
# Step 2: run "./pyenv-installer.sh", this needs sudo privilege. (do not use sh to run this script, it has problem with python virtualenv)
# CAUTION: This script can run only once.
#

# Clear previous sudo permission
sudo -k

#run with sudo
sudo sh <<SCRIPT
    # The programs use sudo, but do not need to input password by creating a file in /etc/sudoers.d/
    echo '\
sloppysun ALL=(ALL) NOPASSWD: /usr/local/sbin/dnscrypt-proxy\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/sbin/iotop\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/bin/wireshark\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/bin/vim\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/local/bin/npm\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/bin/make\n' > /etc/sudoers.d/exemption

    # set timeout for ssh connection
    echo '\
    ServerAliveInterval 999999' >> /etc/ssh/ssh_config

    # disable ubuntu crash report
    sed -i "s/enabled=1/enabled=0/g" '/etc/default/apport'

    # disable my dedicated graphic card for saving power
    # next line will make it effective at once.
    # And the content put in rc.local will assure this setting can be activated each time the computer start.
    echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
    sed -i '/^exit 0/ i \
echo ON > /sys/kernel/debug/vgaswitcheroo/switch\n\
echo IGD > /sys/kernel/debug/vgaswitcheroo/switch\n\
echo OFF > /sys/kernel/debug/vgaswitcheroo/switch\n' '/etc/rc.local'

    # add a number of dns records
    echo '\n192.168.56.189 test\n\
114.80.203.146 production\n\
203.86.235.137 hk\n\
114.80.201.200 staging\n' >> '/etc/hosts'

    # Add virtualbox repository to source.list
    echo 'deb http://download.virtualbox.org/virtualbox/debian raring contrib non-free' >> /etc/apt/sources.list
    wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -

    # Update, You can Do it yourself before running this script.
    apt-get update
    apt-get -y upgrade

    apt-get -y install python-gpgme
    apt-get -y install rar unrar smplayer unetbootin dmg2img bleachbit easytag awesome boinc tidy pgadmin3 bluefish gparted tomboy wireshark chromium-browser meld git-cola dia synaptic vlc gconf-editor
    apt-get -y install virtualbox-4.2

SCRIPT

workspace="workspace"
mkdir ~/$workspace

# Install dotfiles
cd ~
git clone https://github.com/sunsongxp/dotfiles
cd dotfiles
./install.sh

# Install dnscrypt
# TODO Dnscrypt packages haven't been decompressed.
cd ~/workspace/libsodium-0.4.1
./configure
make && make check && sudo make install
sudo ldconfig
cd ~/workspace/dnscrypt-proxy-1.3.2
./configure && make -j4 && sudo make install
