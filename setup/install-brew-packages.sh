#!/bin/bash

set -eu

declare -ar FORMULAS=(
    # Bash
    bash                # https://www.gnu.org/software/bash/
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
    cowsay              # https://github.com/tnalpgge/rank-amateur-cowsay
    figlet              # http://www.figlet.org/
    fortune             # https://www.ibiblio.org/pub/linux/games/amusements/fortune/!INDEX.html
    git                 # https://git-scm.com
    jc                  # https://github.com/kellyjonbrazil/jc
    jq                  # https://github.com/stedolan/jq
    moreutils           # https://joeyh.name/code/moreutils/
    nkf                 # https://osdn.net/projects/nkf/
    num-utils           # https://suso.suso.org/xulu/Num-utils
    pwgen               # https://pwgen.sourceforge.io/
    rlwrap              # https://github.com/hanslub42/rlwrap
    screen              # https://www.gnu.org/software/screen
    tig                 # https://github.com/jonas/tig
    util-linux          # https://github.com/util-linux/util-linux
    vim                 # https://www.vim.org/
    watch               # https://gitlab.com/procps-ng/procps
    yq                  # https://github.com/mikefarah/yq

    # Programming Languages
    erlang              # https://www.erlang.org/
    gauche              # https://practical-scheme.net/gauche/
    gforth              # https://www.gnu.org/software/gforth
    ghc                 # https://haskell.org/ghc/
    gnu-prolog          # http://www.gprolog.org/
    go                  # https://go.dev/
    php                 # https://www.php.net/
    python@3.11         # https://www.python.org/
    rbenv               # https://github.com/rbenv/rbenv#readme
    rust                # https://www.rust-lang.org/

    # Others
    r                   # https://www.r-project.org/
    semgrep             # https://semgrep.dev
)

if $(which brew > /dev/null); then
    brew install "${FORMULAS[@]}"
fi

