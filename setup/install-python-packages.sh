#!/bin/bash

set -eu

if $(which pip3 > /dev/null); then
    pip3 install virtualenv # https://virtualenv.pypa.io/
fi

