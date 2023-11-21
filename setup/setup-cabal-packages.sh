#!/usr/bin/env bash

set -eu -o pipefail

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"

if $(which cabal > /dev/null); then
    cd "${ROOT_DIR}"
    cabal update
    cabal install --lib HUnit
    cabal clean
fi

