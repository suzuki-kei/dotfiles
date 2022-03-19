#!/bin/bash

readonly BASE_DIR="$(cd $(dirname "${BASH_SOURCE}") && pwd)"

source "${BASE_DIR}/.bashrc-common"

if [[ "$(uname)" == "Linux" ]]; then
    source "${BASE_DIR}/.bashrc-linux"
fi

if [[ "$(uname)" == "Darwin" ]]; then
    source "${BASE_DIR}/.bashrc-mac"
fi

