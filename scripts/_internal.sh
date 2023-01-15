#!/bin/bash
#
# 内部的に使用する関数を定義します.
#

#
# ヒアドキュメントの不要なインデントを削除します.
#
# Input:
#     標準入力から処理対象のヒアドキュメントを読み取ります.
#
# Output:
#     処理結果を標準出力に出力します.
#
# Returns:
#     処理に成功した場合は 0 を返します.
#     処理に失敗した場合の戻り値は未定義です.
#
function _strip_heredoc
{
    local text="$(cat)"
    local char
    local leading_chars

    for char in ' ' '\t'
    do
        leading_chars="$(echo "$text" | grep -oP "^($char+)" | sort | head -1)"
        text="$(echo "$text" | sed -r "s/^$leading_chars//")"
    done

    echo "$text"
}

