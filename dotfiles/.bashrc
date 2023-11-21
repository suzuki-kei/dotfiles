
shopt -s extglob

export EDITOR=vi
export PAGER=less
export PS1="$(test "$(whoami)" == 'root' && echo '# ' || echo '$ ')"
export TZ='Asia/Tokyo'

# history
export HISTCONTROL=ignoredups
export HISTFILESIZE=7777777
export HISTSIZE=7777777
export HISTTIMEFORMAT="%Y-%m-%d %T "

# ls
alias ls='\ls --color=never --time-style=long-iso'
alias l='ls -1F'
alias ll='ls -lhF'
alias la='ll -a'

# settings for Linux only
if [[ "$(uname)" == 'Linux' ]]; then
    :
fi

# settings for Mac only
if [[ "$(uname)" == 'Darwin' ]]; then
    # see https://support.apple.com/en-us/HT208050
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Homebrew
if which brew > /dev/null; then
    # see https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
    export HOMEBREW_NO_ANALYTICS=1

    declare -r BREW_PREFIX="$(brew --prefix)"

    export MANPATH="${BREW_PREFIX}/opt/*/libexec/gnuman:$MANPATH"
    export PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="${BREW_PREFIX}/opt/findutils/libexec/gnubin:$PATH"
    export PATH="${BREW_PREFIX}/opt/gawk/libexec/gnubin:$PATH"
    export PATH="${BREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="${BREW_PREFIX}/opt/grep/libexec/gnubin:$PATH"
    export PATH="${BREW_PREFIX}/opt/python3/bin:$PATH"
    export PATH="${BREW_PREFIX}/opt/ruby/bin:$PATH"
    export PATH="${BREW_PREFIX}/opt/util-linux/bin:$PATH"
    export PATH="${BREW_PREFIX}/opt/util-linux/sbin:$PATH"

    source "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi

# Ruby (rbenv)
if [[ -d "$HOME/.rbenv/shims" ]]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
fi

# Go
if $(which go > /dev/null); then
    export GOPATH=$(go env GOPATH)
    export PATH="$GOPATH/bin:$PATH"
fi

# custom scripts and functions
export PATH="$(cd $(dirname "${BASH_SOURCE}")/.. && pwd)/scripts:$PATH"
source "$(dirname "${BASH_SOURCE}")/.bashrc.functions"

