#!/usr/bin/env bash

set -eu -o pipefail

if $(which go > /dev/null); then
    go install golang.org/x/tools/cmd/godoc@latest
fi

