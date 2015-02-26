#!/bin/bash

# Author: 孙松
# Date: 07-17-2014
#
# README
# This script is aimed at help building a python developing environment using Django, MySQL, redis, PostgreSQL. Heroku, Version control systems like git and svn, openvpn client, virtualenv and common libraries for python are also included. This script were tested under ubuntu 12.04.
# Step 1: run "chmod +x pyenv-installer.sh"
# Step 2: Change variable "workspace" below, which is folder name created under "~" and storing virtualenv files.
# Step 3: run "./pyenv-installer.sh", this needs sudo privilege. (do not use sh to run this script, it has problem with python virtualenv)
# Step 4: redis-server needs to be configured by hands, so read the script about it below. (I will improve it later.)
# Step 5: go to the workspace directory, and run "source venv/bin/activate", then run python as you like.
#

# Clear previous sudo permission
sudo -k

#run with sudo
sudo sh <<SCRIPT
    # Update, You can Do it yourself before running this script.
    apt-get update
    apt-get -y upgrade


    # Basic Tools
    apt-get -y install ssh openssh-server tmux tilda ack-grep ipython traceroute tsocks swaks curl ncdu pwgen tig zsh siege

    # Version Control System
    apt-get -y install git git-flow subversion

    # For monitoring (sysstat is running as command "iostat")
    apt-get -y install htop iotop sysstat iptraf iftop nmon

    # Install exuberant-ctags
    apt-get -y install exuberant-ctags

    # Source Building and Compiling
    apt-get -y install build-essential cmake

    # Install databases
    apt-get -y install postgresql postgresql-server-dev-9.3
    # build-dep means that install all dependencies for 'packagename' so that I can build it.
    apt-get -y build-dep python-mysqldb
    apt-get -y install sqlite3
    apt-get -y mongodb-server

    # Install python-setuptools
    apt-get -y install python-setuptools

    # Install python-dev
    apt-get -y install python-dev

    # Matplotlib needs those libraries (also needs python-dev)
    apt-get -y install libfreetype6-dev libpng-dev

    # Install pip 
    apt-get -y install python-pip 

    # Install virtualenv
    apt-get -y install python-virtualenv

    # Install go-lang
    apt-get -y install golang

    # Due to a bug in pip?, I need to reinstall pip this way:
    easy_install pip

    # Install Docker
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
    apt-get update
    apt-get -y install docker.io
    apt-get install lxc-docker
    #ln -sf /usr/bin/docker.io /usr/local/bin/docker

    pip install fig
    pip install joe

SCRIPT
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
