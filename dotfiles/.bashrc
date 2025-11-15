
# ------------------------------------------------------------------------------
# bash options
# ------------------------------------------------------------------------------

shopt -s extglob

# ------------------------------------------------------------------------------
# exports
# ------------------------------------------------------------------------------

export EDITOR=vi
export PAGER=less
export PS1="$(test "$(whoami)" == 'root' && echo '# ' || echo '$ ')"
export TZ='Asia/Tokyo'

# locale
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_NUMERIC=C
export LC_TIME=C
export LC_MESSAGES=C

# history
export HISTCONTROL=ignoredups
export HISTFILESIZE=7777777
export HISTSIZE=7777777
export HISTTIMEFORMAT="%Y-%m-%d %T "

# ------------------------------------------------------------------------------
# aliases
# ------------------------------------------------------------------------------

# ls
if \ls --time-style=long-iso >/dev/null 2>&1; then
    alias ls='\ls --color=never --time-style=long-iso'
else
    alias ls='\ls --color=never'
fi
alias l='ls -1F'
alias ll='ls -lhF'
alias la='ll -a'

# screen
alias s='screen'

# touch
alias t='touch'

# vimdiff - always disable folding
alias vimdiff="vimdiff '+windo set nofoldenable' '+windo set foldcolumn=0' '+wincmd t' +1"

# ------------------------------------------------------------------------------
# distribution/software specific settings
# ------------------------------------------------------------------------------

# settings for Linux only
if [[ "$(uname)" == 'Linux' ]]; then
    : nothing to do
fi

# settings for Mac only
if [[ "$(uname)" == 'Darwin' ]]; then
    # see https://support.apple.com/en-us/HT208050
    export BASH_SILENCE_DEPRECATION_WARNING=1

    # /etc/bashrc で読み込まれる /etc/bashrc_Apple_Terminal を無効化する
    if [[ ! -e ~/.bash_sessions_disabled ]]; then
        touch ~/.bash_sessions_disabled
    fi
fi

# custom executables
if [[ "$(uname)" == 'Linux' ]]; then
    export PATH="$(cd -- $(dirname -- "${BASH_SOURCE[0]}")/.. && pwd)/bin/linux:${PATH}"
fi
if [[ "$(uname)" == 'Darwin' ]]; then
    export PATH="$(cd -- $(dirname -- "${BASH_SOURCE[0]}")/.. && pwd)/bin/mac:${PATH}"
    export PATH="$(cd -- $(dirname -- "${BASH_SOURCE[0]}")/.. && pwd)/bin/linux:${PATH}"
fi

# custom functions
source "$(dirname -- "${BASH_SOURCE[0]}")/.bashrc.functions"

# Homebrew
if which brew > /dev/null; then
    # see https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
    export HOMEBREW_NO_ANALYTICS=1

    eval "$(brew shellenv)"

    export MANPATH="${HOMEBREW_PREFIX}/opt/*/libexec/gnuman:${MANPATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/gawk/libexec/gnubin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/mysql-client/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/openjdk/bin:$PATH"
    export PATH="${HOMEBREW_PREFIX}/opt/python3/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/ruby/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/util-linux/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/util-linux/sbin:${PATH}"

    if [[ -e "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    fi
fi

# Ruby (rbenv)
if [[ -d "${HOME}/.rbenv/shims" ]]; then
    export PATH="${HOME}/.rbenv/shims:${PATH}"
fi

# Go
if which go > /dev/null; then
    export GOPATH=~/.go
    export PATH="${GOPATH}/bin:${PATH}"
fi

