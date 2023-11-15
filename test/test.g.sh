#!/bin/bash

set -eu -o errtrace -o pipefail
trap 'echo "Assertion failed at line ${LINENO}: ${BASH_COMMAND}"' ERR

declare -r ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "${ROOT_DIR}/scripts/g"

function test_main
{
    run_test with_url
    run_test with_file_path
    run_test with_search_keyword
}

function run_test
{
    declare -r name="$1"
    echo -n "g ${name} ... "
    test.${name}
    echo "OK"
}

function test.with_url
{
    # URL を指定する場合.
    test \
		"$(
            make_open_command 'https://example.com'
        )" = "$(
            cat <<-EOS
				open -n -a 'Google Chrome' --args --incognito 'https://example.com'
			EOS
        )"
}

function test.with_file_path
{
    # ファイルパスを指定する場合.
    declare -r file_path="$(cd "$(dirname "$0")" && pwd)/$(basename "$0")"
    test \
		"$(
            make_open_command "${file_path}"
        )" = "$(
            cat <<-EOS
				open -n -a 'Google Chrome' --args --incognito '${file_path}'
			EOS
        )"
}

function test.with_search_keyword
{
    # 検索キーワードを指定する場合.
    test \
		"$(
            make_open_command 'one' 'two' 'three'
        )" = "$(
            cat <<-EOS
				open -n -a 'Google Chrome' --args --incognito 'https://www.google.com/search?q=one%20two%20three'
			EOS
        )"
}

if [[ "$0" == "${BASH_SOURCE}" ]]; then
    test_main "$@"
fi

