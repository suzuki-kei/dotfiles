#!/usr/bin/env bash

set -eu -o pipefail

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r SETUP_DIR="${ROOT_DIR}/setup"

function main
{
    setup_dotfiles
    setup_brew_packages
    setup_python_packages
    setup_go_packages
}

function setup_dotfiles
{
    declare -r dotfiles_dir="${ROOT_DIR}/dotfiles"
    declare -r bashrc_path="${dotfiles_dir}/.bashrc"

    if [[ ! -f ~/.bashrc ]]; then
        touch ~/.bashrc
    fi
    if ! grep -E "^source '${bashrc_path}'$" ~/.bashrc > /dev/null; then
        echo "source '${bashrc_path}'" >> ~/.bashrc
    fi

    declare -r file_names=(
        .bash_profile
        .gitconfig
        .screenrc
        .vimrc
        .docker/config.json
    )
    for file_name in "${file_names[@]}"
    do
        if [[ ! -f ~/${file_name} ]]; then
            cp -p {"${dotfiles_dir}",~}/"${file_name}"
        fi
    done

    mkdir -p ~/.vim
    ln -fsT "${dotfiles_dir}/.vim/plugin" ~/.vim/plugin
}

function setup_brew_packages
{
    if $(which brew > /dev/null); then
        brew bundle --cleanup --no-lock --file "${SETUP_DIR}/Brewfile"
    fi
}

function setup_python_packages
{
    if $(which pip3 > /dev/null); then
        pip3 install --break-system-packages --upgrade pip
        pip3 install --break-system-packages -Ur "${SETUP_DIR}/requirements.txt"
    fi
}

function setup_go_packages
{
    if $(which go > /dev/null); then
        go install golang.org/x/tools/cmd/godoc@latest
    fi
}

main

