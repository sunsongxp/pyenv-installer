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
sloppysun ALL=(ALL) NOPASSWD: /usr/sbin/iotop\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/bin/wireshark\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/bin/vim\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/local/bin/npm\n\
sloppysun ALL=(ALL) NOPASSWD: /usr/bin/make\n' > /etc/sudoers.d/exemption

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


    apt-get update
    apt-get -y upgrade

    apt-get -y install python-gpgme
    apt-get -y install axel rar unrar dmg2img tidy
    apt-get -y install smplayer unetbootin bleachbit easytag awesome pgadmin3 gparted tomboy wireshark chromium-browser meld git-cola synaptic vlc gconf-editor network-manager-openvpn
    apt-get -y install sqlitebrowser
    apt-get -y install silversearcher-ag
    apt-get -y install tzwatch
    apt-get -y install kcachegrind
    apt-get -y install cmus
    apt-get -y install imagemagick
    apt-get -y install task

SCRIPT

