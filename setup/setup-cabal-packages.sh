#!/bin/bash

set -eu

declare -r SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"

if $(which cabal > /dev/null); then
    cabal update
    cabal install --lib HUnit
    cabal clean
fi

