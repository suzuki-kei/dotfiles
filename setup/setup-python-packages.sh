#!/bin/bash

set -eu

declare -r SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"

if $(which pip3 > /dev/null); then
    pip3 install --upgrade pip
    pip3 install -Ur "${SETUP_DIR}/requirements.txt"
fi

