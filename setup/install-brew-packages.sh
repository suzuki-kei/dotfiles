#!/bin/bash

set -eu

declare -r SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"

if $(which brew > /dev/null); then
    brew bundle --cleanup --no-lock --file "${SETUP_DIR}/Brewfile"
fi

