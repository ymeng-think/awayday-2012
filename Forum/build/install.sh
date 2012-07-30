#!/bin/bash

BASE_DIR=${PWD%/*}
PYTHON_ENV_DIR=$BASE_DIR/python-env

echo $PYTHON_ENV_DIR

virtualenv-2.7 --python=python2.7 $PYTHON_ENV_DIR
source $PYTHON_ENV_DIR/bin/activate

pip install paver
