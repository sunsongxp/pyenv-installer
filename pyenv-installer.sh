#!/bin/bash

# Author: 孙松
# Date: 08-01-2013
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
    apt-get -y install ssh openssh-server vim tmux tilda ack-grep ipython traceroute tsocks swaks curl

    # Version Control System
    apt-get -y install git subversion

    # For monitoring (sysstat is running as command "iostat")
    apt-get -y install htop iotop sysstat iptraf iftop

    # Source Building and Compiling
    apt-get -y install build-essential

    # Install databases
    apt-get -y install postgresql postgresql-server-dev-9.1
    # build-dep means that install all dependencies for 'packagename' so that I can build it.
    apt-get -y build-dep python-mysqldb
    apt-get -y install sqlite3

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

SCRIPT

redis_url="http://download.redis.io/redis-stable.tar.gz"
redis_file_name="redis-stable.tar.gz"

########################
# Install redis-server
########################
wget $redis_url
tar xvzf $redis_file_name
cd redis-stable
make
make test
sudo make install
#Setup commands needed to be run as sudo
cd utils
sudo ./install_server.sh
#Then use "service" to start redis-server


##############################
# Create virtual environment
##############################
workspace="workspace"
mkdir ~/$workspace
cd ~/$workspace

#start virtualenv
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

# Install Gunicorn
pip install gunicorn

# Install numpy and matplotlib
pip install numpy
pip install matplotlib

# BeautifulSoup is for parsing html
pip install BeautifulSoup

# fabric for deployment, pytz handles timezone, xlwt render xls spreadsheet
# South for migration
pip install fabric pytz xlwt South

#BeautifulSoup is for parsing html
pip install BeautifulSoup

# Other useful packages, django-geoip can convert ip address to address
pip install django-geoip

# psycopg2 is django PostgreSQL backend, html5lib can parse html5 file, html2text can convert html to markdown format

pip install pep8 ipdb django-extensions django-debug-toolbar ipython

pip install requests
pip install rq

# For Django Oscar
pip install django-oscar django-storages boto django-redis hiredis django-redis-sessions
