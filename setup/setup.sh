#!/usr/bin/env bash

set -eu -o pipefail

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r SETUP_DIR="${ROOT_DIR}/setup"

bash "${SETUP_DIR}/setup-dotfiles.sh"
bash "${SETUP_DIR}/setup-brew-packages.sh"
bash "${SETUP_DIR}/setup-python-packages.sh"
bash "${SETUP_DIR}/setup-go-packages.sh"

