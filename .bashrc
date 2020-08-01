#!/bin/bash

# ------------------------------------------------------------------------------
#  Bash Settings (general)
# ------------------------------------------------------------------------------

export TZ='Asia/Tokyo'
export PAGER=less
export EDITOR=vi

# ------------------------------------------------------------------------------
#  Bash Settings (history command)
# ------------------------------------------------------------------------------

export HISTSIZE=7777777
export HISTFILESIZE=7777777
export HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTCONTROL=ignoredups

# ------------------------------------------------------------------------------
#  Aliases (ls command)
# ------------------------------------------------------------------------------

alias ls='\ls --time-style=long-iso'
alias ll='ls -lhp'
alias la='ll -a'

# ------------------------------------------------------------------------------
#  Custom Commands
# ------------------------------------------------------------------------------

export PATH="$(cd $(dirname $BASH_SOURCE); pwd)/scripts:$PATH"

# date の出力形式を変更する.
function date_with_defaults
{
    if [ $# == 0 ]; then
        date "+%Y-%m-%d %H:%M:%S %Z"
    else
        date "$@"
    fi
}
alias date=date_with_defaults

