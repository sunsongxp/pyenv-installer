#! /bin/bash


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

