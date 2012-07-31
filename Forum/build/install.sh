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



