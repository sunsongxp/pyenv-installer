#!/bin/bash

#author:	孙松
#date:	02-04-2013
#
# README
# This script is aimed at help building a python developing environment using Django, MySQL, redis, PostgreSQL. Heroku, Version control systems like git and svn, openvpn client, virtualenv and common libraries for python are also included. This script were tested under ubuntu 12.04.
# Step 1: run "chmod +x pyenv-installer.sh"
# Step 2: Change variable "workspace" below, which is folder name created under "~" and storing virtualenv files.
# Step 3: run "./pyenv-installer.sh", this needs sudo privilege.
# Step 4: redis-server needs to be configured by hands, so read the script about it below. (I will improve it later.)
# Step 5: go to the workspace directory, and run "source venv/bin/activate", then run python as you like.
#

#clear previous sudo permission
sudo -k

#run with sudo
sudo sh <<SCRIPT
	#Update, You can Do it yourself before running this script.
	apt-get update
	apt-get -y upgrade

	#traditional gnome
	apt-get -y install gnome-session-fallback

	#install python-setuptools
	apt-get -y install python-setuptools

	#Install version control systems & other tools
	apt-get -y install vim git git-cola ssh subversion

	#Install openvpn client
	apt-get -y install network-manager-openvpn-gnome

	#Java
	#add-apt-repository ppa:webupd8team/java
	#apt-get update
	#apt-get -y install oracle-java7-install

	#Install build system
	apt-get -y install build-essential

	#install databases
	apt-get -y install postgresql postgresql-server-dev-9.1
	apt-get -y build-dep python-mysqldb

	#install python-dev
	apt-get -y install python-dev
	
	#matplotlib needs those libraries (also needs python-dev)
	apt-get -y install libfreetype6-dev libpng-dev

	#Install pip 
	apt-get -y install python-pip 

	#install virtualenv
	pip install virtualenv

	#Install Heroku
	#from https://toolbelt.heroku.com/install-ubuntu.sh

	# add heroku repository to apt
	echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list

	# install heroku's release key for package verification
	wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -

	# update your sources
	apt-get update

	# install the toolbelt
	apt-get install -y heroku-toolbelt

SCRIPT

redis_url="http://download.redis.io/redis-stable.tar.gz"
redis_file_name="redis-stable.tar.gz"

#install redis-server
wget $redis_url
tar xvzf $redis_file_name
cd redis-stable
make
make test
#Setup commands needed to be run as sudo
#cd utils
#sudo ./install_server.sh
#Then use "service" to start redis-server

workspace="workspace"
mkdir ~/$workspace
cd ~/$workspace

#start virtualevn
virtualenv venv --no-site-packages --distribute
source venv/bin/activate

#install python database client
pip install Django psycopg2 dj-database-url
pip install MySQL-python
pip install redis

#install RedisLive
RedisLive_url="https://github.com/kumarnitin/RedisLive.git"
pip install tornado python-dateutil argparse
git clone $RedisLive_url

#install Gunicorn
pip install gunicorn

#install numpy and matplotlib
pip install numpy
pip install matplotlib 