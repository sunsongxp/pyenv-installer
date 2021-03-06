#!/usr/bin/env bash
# Things to do after installing Ubuntu 14.04 Trusty Tahr
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-add-repository -y ppa:zeal-developers/ppa

sudo apt-get update
sudo apt-get install -y git curl
sudo apt-get install -y synaptic vlc gimp gimp-data gimp-plugin-registry gimp-data-extras y-ppa-manager bleachbit openjdk-7-jre oracle-java8-installer flashplugin-installer unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller libxine1-ffmpeg mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 totem-mozilla icedax lame libmad0 libjpeg-progs libdvdread4 libdvdnav4 libswscale-extra-2 ubuntu-restricted-extras ubuntu-wallpapers-trusty
sudo apt-get install -y audacity pavucontrol

sudo apt-get install -y mysql-workbench

sudo apt-get install -y ansible

sudo apt-get install -y pepperflashplugin-nonfree
sudo update-pepperflashplugin-nonfree --install

sudo apt-get install zeal

# install VIM
sudo apt-get install -y mercurial
# bug: ubuntu 14.04.2 install newer version of the following package
sudo apt-get install -y libfreetype6=2.5.2-1ubuntu2.3
curl -L https://gist.githubusercontent.com/sunsongxp/1a9c1542cde5ef518483/raw/d81cf459489ad1bb178a74aeaa3c06eb8a394203/vim74_lua | sh

# install oh-my-zsh
sudo apt-get install -y zsh

curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh

# install spf13
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# remove unnecessary sotfware
wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash

sudo add-apt-repository ppa:saiarcot895/myppa
sudo apt-get install apt-fast
sudo apt-get install unity-tweak-tool

sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5

sudo apt-get remove update-manager # remove annoying notification
sudo apt-get remove update-manager-core
sudo apt-get remove update-notifier

sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.6-103037.vbox-extpack
