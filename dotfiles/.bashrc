

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

# history
export HISTCONTROL=ignoredups
export HISTFILESIZE=7777777
export HISTSIZE=7777777
export HISTTIMEFORMAT="%Y-%m-%d %T "

# ------------------------------------------------------------------------------
# aliases
# ------------------------------------------------------------------------------

# ls
alias ls='\ls --color=never --time-style=long-iso'
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
fi

# custom executables
export PATH="$(cd -- $(dirname -- "${BASH_SOURCE[0]}")/.. && pwd)/bin:${PATH}"

# custom functions
source "$(dirname -- "${BASH_SOURCE[0]}")/.bashrc.functions"

# Homebrew
if which brew > /dev/null; then
    # see https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
    export HOMEBREW_NO_ANALYTICS=1

    export MANPATH="$(brew --prefix)/opt/*/libexec/gnuman:${MANPATH}"
    export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:${PATH}"
    export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:${PATH}"
    export PATH="$(brew --prefix)/opt/gawk/libexec/gnubin:${PATH}"
    export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:${PATH}"
    export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:${PATH}"
    export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"
    export PATH="$(brew --prefix)/opt/python3/bin:${PATH}"
    export PATH="$(brew --prefix)/opt/ruby/bin:${PATH}"
    export PATH="$(brew --prefix)/opt/util-linux/bin:${PATH}"
    export PATH="$(brew --prefix)/opt/util-linux/sbin:${PATH}"

    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
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

