#!/bin/bash

set -eu -o errtrace -o pipefail
trap 'echo "Assertion failed at line ${LINENO}: ${BASH_COMMAND}"' ERR

declare -r ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "${ROOT_DIR}/bin/linux/keep-the-spirit-of-c"

function test_main
{
    run_test without_options
    run_test with_a_option
    run_test with_c89_option
    run_test with_c11_option
}

function run_test
{
    declare -r name="$1"
    echo -n "keep-the-spirit-of-c ${name} ... "
    test.${name}
    echo "OK"
}

function test.without_options
{
    # オプションを指定しない場合.
    test \
		"$(
            main
        )" = "$(
            cat <<-EOS
				Keep the spirit of C (C89)
				    * Trust the programmer.
				    * Don't prevent the programmer from doing what needs to be done.
				    * Keep the language small and simple.
				    * Provide only one way to do an operation.
				    * Make it fast, even if it is not guaranteed to be portable.
			EOS
        )"
}

function test.with_a_option
{
    # -a オプションを指定する場合.
    test \
		"$(
            main -a
        )" = "$(
            cat <<-EOS
				Keep the spirit of C (C89)
				    * Trust the programmer.
				    * Don't prevent the programmer from doing what needs to be done.
				    * Keep the language small and simple.
				    * Provide only one way to do an operation.
				    * Make it fast, even if it is not guaranteed to be portable.

				Keep the spirit of C (C11)
				    (a) Trust the programmer.
				    (b) Don't prevent the programmer from doing what needs to be done.
				    (c) Keep the language small and simple.
				    (d) Provide only one way to do an operation.
				    (e) Make it fast, even if it is not guaranteed to be portable.
				    (f) Make support for safety and security demonstrable.
			EOS
        )"
}

function test.with_c89_option
{
    # -c89 オプションを指定する場合.
    test \
		"$(
            main -c89
        )" = "$(
            cat <<-EOS
				Keep the spirit of C (C89)
				    * Trust the programmer.
				    * Don't prevent the programmer from doing what needs to be done.
				    * Keep the language small and simple.
				    * Provide only one way to do an operation.
				    * Make it fast, even if it is not guaranteed to be portable.
			EOS
        )"
}

function test.with_c11_option
{
    # -c11 オプションを指定する場合.
    test \
		"$(
            main -c11
        )" = "$(
            cat <<-EOS
				Keep the spirit of C (C11)
				    (a) Trust the programmer.
				    (b) Don't prevent the programmer from doing what needs to be done.
				    (c) Keep the language small and simple.
				    (d) Provide only one way to do an operation.
				    (e) Make it fast, even if it is not guaranteed to be portable.
				    (f) Make support for safety and security demonstrable.
			EOS
        )"
}

if [[ "$0" == "${BASH_SOURCE}" ]]; then
    test_main "$@"
fi

