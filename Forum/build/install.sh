#!/bin/bash

BASE_DIR=${PWD%/*}
PYTHON_ENV_DIR=$BASE_DIR/python-env

echo $PYTHON_ENV_DIR

# install and activate python-env
virtualenv-2.7 --python=python2.7 $PYTHON_ENV_DIR
source $PYTHON_ENV_DIR/bin/activate

# install dependencies for forum-center
pip install -r $BASE_DIR/forum-center/dependencies.txt

# include forum-center module into python path
cd $BASE_DIR/forum-center
paver develop

# ---------------------------------------------------------------------------------------------------------------
# install redis (on Mac)
brew install redis
#
# If this is your first install, automatically load on login with:
#     mkdir -p ~/Library/LaunchAgents
#     cp /usr/local/Cellar/redis/2.4.4/io.redis.redis-server.plist ~/Library/LaunchAgents/
#     launchctl load -w ~/Library/LaunchAgents/io.redis.redis-server.plist
# 
# If this is an upgrade and you already have the io.redis.redis-server.plist loaded:
#     launchctl unload -w ~/Library/LaunchAgents/io.redis.redis-server.plist
#     cp /usr/local/Cellar/redis/2.4.4/io.redis.redis-server.plist ~/Library/LaunchAgents/
#     launchctl load -w ~/Library/LaunchAgents/io.redis.redis-server.plist
# 
#   To start redis manually:
#     redis-server /usr/local/etc/redis.conf
# 
#   To access the server:
#     redis-cli

