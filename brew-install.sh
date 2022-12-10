#!/bin/bash

set -eu

declare -ar FORMULAS=(
    # Bash
    bash-completion     # https://salsa.debian.org/debian/bash-completion

    # GNU
    coreutils           # https://www.gnu.org/software/coreutils
    diffutils           # https://www.gnu.org/s/diffutils/
    findutils           # https://www.gnu.org/software/findutils/
    gawk                # https://www.gnu.org/software/gawk/
    gnu-sed             # https://www.gnu.org/software/sed/
    grep                # https://www.gnu.org/software/grep/

    # General Commands
    bat                 # https://github.com/sharkdp/bat
    figlet              # http://www.figlet.org/
    git                 # https://git-scm.com
    jc                  # https://github.com/kellyjonbrazil/jc
    jq                  # https://github.com/stedolan/jq
    moreutils           # https://joeyh.name/code/moreutils/
    nkf                 # https://osdn.net/projects/nkf/
    num-utils           # https://suso.suso.org/xulu/Num-utils
    pwgen               # https://pwgen.sourceforge.io/
    rlwrap              # https://github.com/hanslub42/rlwrap
    tig                 # https://github.com/jonas/tig
    vim                 # https://www.vim.org/
    watch               # https://gitlab.com/procps-ng/procps
    yq                  # https://github.com/mikefarah/yq

    # Programming Languages
    gauche              # https://practical-scheme.net/gauche/
    ghc                 # https://haskell.org/ghc/
    go                  # https://go.dev/
    php                 # https://www.php.net/
    python@3.10         # https://www.python.org/
    rbenv               # https://github.com/rbenv/rbenv#readme

    # Others
    minikube            # https://minikube.sigs.k8s.io/
    semgrep             # https://semgrep.dev
)

brew install "${FORMULAS[@]}"

