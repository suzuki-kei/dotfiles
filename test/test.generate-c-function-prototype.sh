#!/bin/bash

set -eu -o errtrace -o pipefail
trap 'echo "Assertion failed at line ${LINENO}: ${BASH_COMMAND}"' ERR

declare -r ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "${ROOT_DIR}/bin/generate-c-function-prototype"

function test_main
{
    run_test exclude_main_function
    run_test exclude_function_prototype
    run_test various_brace_position
    run_test various_naming_convention
    run_test includes_alphabetical_letter_only
    run_test includes_non_alphabetical_letter
}

function run_test
{
    declare -r name="$1"
    echo -n "generate-c-function-prototype ${name} ... "
    test.${name}
    echo "OK"
}

function test.exclude_main_function
{
    test \
		"$(
            cat <<-EOS | main
				int main() {
				    return 0;
				}
				int main(void) {
				    return 0;
				}
			EOS
        )" = "$(
            cat <<-EOS
			EOS
        )"
}

function test.exclude_function_prototype
{
    test \
		"$(
            cat <<-EOS | main
				void f1(void);
				void f1(void) { }
				void f2(void) { }
			EOS
        )" = "$(
            cat <<-EOS
				void f1(void);
				void f2(void);
			EOS
        )"
}

function test.various_brace_position
{
    test \
		"$(
            cat <<-EOS | main
				void f1(void){}
				void f2(void) {}
				void f3(void){ }
				void f4(void) { }
				void f5(void){
				}
				void f6(void) {
				}
			EOS
        )" = "$(
            cat <<-EOS
				void f1(void);
				void f2(void);
				void f3(void);
				void f4(void);
				void f5(void);
				void f6(void);
			EOS
        )"
}

function test.various_naming_convention
{
    test \
		"$(
            cat <<-EOS | main
				void snake_case(void) { }
				void camelCase(void) { }
				void PascalCase(void) { }
				void SCREAMING_CASE(void) { }
			EOS
        )" = "$(
            cat <<-EOS
				void snake_case(void);
				void camelCase(void);
				void PascalCase(void);
				void SCREAMING_CASE(void);
			EOS
        )"
}

function test.includes_alphabetical_letter_only
{
    test \
		"$(
            cat <<-EOS | main
				void function(void) { }
			EOS
        )" = "$(
            cat <<-EOS
				void function(void);
			EOS
        )"
}

function test.includes_non_alphabetical_letter
{
    test \
		"$(
            cat <<-EOS | main
				void swap1(int *value1, int *value2) { }
				void swap2(int* value1, int* value2) { }
				std::ostream &operator<<(std::ostream &ostream, const std::vector<int> &values) { }
			EOS
        )" = "$(
            cat <<-EOS
				void swap1(int *value1, int *value2);
				void swap2(int* value1, int* value2);
				std::ostream &operator<<(std::ostream &ostream, const std::vector<int> &values);
			EOS
        )"
}

if [[ "$0" == "${BASH_SOURCE}" ]]; then
    test_main "$@"
fi

