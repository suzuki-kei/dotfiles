#!/bin/bash

set -eu

if $(which go > /dev/null); then
    go install golang.org/x/tools/cmd/godoc@latest
fi

