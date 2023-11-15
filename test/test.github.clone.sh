#!/bin/bash

set -eu -o errtrace -o pipefail
trap 'echo "Assertion failed at line ${LINENO}: ${BASH_COMMAND}"' ERR

declare -r ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "${ROOT_DIR}/scripts/github.clone"

function test_main
{
    run_test clone_via_ssh
    run_test clone_via_https
}

function run_test
{
    declare -r name="$1"
    echo -n "github.clone ${name} ... "
    test.${name}
    echo "OK"
}

function test.clone_via_ssh
{
    # ssh 経由で git clone する場合.
    test \
		"$(
            make_git_clone_command '/tmp/workspace' 'git@github.com:suzuki-kei/dotfiles.git'
        )" = "$(
            cat <<-EOS
				git clone 'git@github.com:suzuki-kei/dotfiles.git' '/tmp/workspace/suzuki-kei/dotfiles'
			EOS
        )"
}

function test.clone_via_https
{
    # HTTPS 経由で git clone する場合.
    test \
		"$(
            make_git_clone_command '/tmp/workspace' 'https://github.com/suzuki-kei/dotfiles.git'
        )" = "$(
            cat <<-EOS
				git clone 'https://github.com/suzuki-kei/dotfiles.git' '/tmp/workspace/suzuki-kei/dotfiles'
			EOS
        )"
}

if [[ "$0" == "${BASH_SOURCE}" ]]; then
    test_main "$@"
fi

