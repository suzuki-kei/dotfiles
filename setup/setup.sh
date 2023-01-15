#!/bin/bash

set -eu

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r SETUP_DIR="${ROOT_DIR}/setup"

bash "${SETUP_DIR}/install-dotfiles.sh"
bash "${SETUP_DIR}/install-brew-packages.sh"
bash "${SETUP_DIR}/install-python-packages.sh"
bash "${SETUP_DIR}/install-go-packages.sh"

