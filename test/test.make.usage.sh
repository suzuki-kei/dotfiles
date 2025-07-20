#!/bin/bash

set -eu -o errtrace -o pipefail
trap 'echo "Assertion failed at line ${LINENO}: ${BASH_COMMAND}"' ERR

declare -r ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "${ROOT_DIR}/bin/make.usage"

function test_main
{
    run_test example

    run_test rule_name_is_one_char
    run_test rule_name_is_multi_char

    run_test rule_name_start_with_special_char
    run_test rule_name_contains_special_char
    run_test rule_name_end_with_special_char

    run_test rule_depends_on_other_rule

    run_test comment_start_with_comment_char
    run_test comment_contains_comment_char
    run_test comment_end_with_comment_char
}

function run_test
{
    declare -r name="$1"
    echo -n "make.usage ${name} ... "
    test.${name}
    echo "OK"
}

function test.example
{
    # 使用例
    test \
		"$(
            main <<-EOS
				help: # 各ルールの説明を表示する.
					echo OK

				build: # 成果物を生成する.
					echo OK

				clean: # 成果物と中間ファイルを削除する.
					echo OK
			EOS
        )" = "$(
            cat <<-EOS
				help   各ルールの説明を表示する.
				build  成果物を生成する.
				clean  成果物と中間ファイルを削除する.
			EOS
        )"
}

function test.rule_name_is_one_char
{
    # ルール名が 1 文字の場合.
    test \
		"$(
            main <<-EOS
				a:
				a:#comment
				a: #comment
				a:# comment
				a: # comment
			EOS
        )" = "$(
            cat <<-EOS
				a  
				a  comment
				a  comment
				a  comment
				a  comment
			EOS
        )"
}

function test.rule_name_is_multi_char
{
    # ルール名が複数文字の場合.
    test \
		"$(
            main <<-EOS
				ab:
				ab:#comment
				ab: #comment
				ab:# comment
				ab: # comment
			EOS
        )" = "$(
            cat <<-EOS
				ab  
				ab  comment
				ab  comment
				ab  comment
				ab  comment
			EOS
        )"
}

function test.rule_name_start_with_special_char
{
    # ルール名の先頭が ".", "_", "-" である場合.
    test \
		"$(
            main <<-EOS
				.a: # comment
				_a: # comment
				-a: # comment
			EOS
        )" = ""
}

function test.rule_name_contains_special_char
{
    # ルール名の途中に ".", "_", "-" が含まれる場合.
    test \
		"$(
            main <<-EOS
				a.b_c-d:
				a.b_c-d:#comment
				a.b_c-d: #comment
				a.b_c-d:# comment
				a.b_c-d: # comment
				a.: # comment
				a_: # comment
				a-: # comment
			EOS
        )" = "$(
            cat <<-EOS
				a.b_c-d  
				a.b_c-d  comment
				a.b_c-d  comment
				a.b_c-d  comment
				a.b_c-d  comment
				a.       comment
				a_       comment
				a-       comment
			EOS
        )"
}

function test.rule_name_end_with_special_char
{
    # ルール名の末尾が ".", "_", "-" である場合.
    test \
		"$(
            main <<-EOS
				a.: # comment
				a_: # comment
				a-: # comment
			EOS
        )" = "$(
            cat <<-EOS
				a.  comment
				a_  comment
				a-  comment
			EOS
        )"
}

function test.rule_depends_on_other_rule
{
    # ルールが他のルールに依存する場合
    test \
		"$(
            main <<-EOS
				name: other # comment
				name: other1 other2 # comment
			EOS
        )" = "$(
            cat <<-EOS
				name  comment
				name  comment
			EOS
        )"
}

function test.comment_start_with_comment_char
{
    # コメントの先頭が "#" である場合.
    test \
		"$(
            main <<-EOS
				name: ## comment
				name: # #comment
			EOS
        )" = "$(
            cat <<-EOS
				name  # comment
				name  #comment
			EOS
        )"
}

function test.comment_contains_comment_char
{
    # コメントの途中に "#" が含まれる場合
    test \
		"$(
            main <<-EOS
				name: # aaa#bbb
				name: # #c#o#m#m#e#n#t#
			EOS
        )" = "$(
            cat <<-EOS
				name  aaa#bbb
				name  #c#o#m#m#e#n#t#
			EOS
        )"
}

function test.comment_end_with_comment_char
{
    # コメントの途中に "#" が含まれる場合
    test \
		"$(
            main <<-EOS
				name: # comment#
				name: # comment #
				name: # comment# 
			EOS
        )" = "$(
            cat <<-EOS
				name  comment#
				name  comment #
				name  comment# 
			EOS
        )"
}

if [[ "$0" == "${BASH_SOURCE}" ]]; then
    test_main "$@"
fi

