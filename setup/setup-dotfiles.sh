#!/usr/bin/env bash

set -eu -o pipefail

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r DOTFILES_DIR="${ROOT_DIR}/dotfiles"
declare -r BASHRC_PATH="${DOTFILES_DIR}/.bashrc"

if [[ ! -f ~/.bashrc ]]; then
    touch ~/.bashrc
fi
if ! grep -E "^source '${BASHRC_PATH}'$" ~/.bashrc > /dev/null; then
    echo "source '${BASHRC_PATH}'" >> ~/.bashrc
fi

declare -r FILE_NAMES=(
    .bash_profile
    .gitconfig
    .screenrc
    .vimrc
    .docker/config.json
)
for file_name in "${FILE_NAMES[@]}"
do
    if [[ ! -f ~/${file_name} ]]; then
        cp -p {"${DOTFILES_DIR}",~}/"${file_name}"
    fi
done

