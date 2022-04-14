# dotfiles

## セットアップ

### Homebrew をインストールする (Mac only)

以下のページを参照:

    https://brew.sh/

### Homebrew でインストールする (Mac only)

    # Bash
    brew install bash-completion    # https://salsa.debian.org/debian/bash-completion

    # GNU
    brew install coreutils          # https://www.gnu.org/software/coreutils
    brew install diffutils          # https://www.gnu.org/s/diffutils/
    brew install findutils          # https://www.gnu.org/software/findutils/
    brew install gawk               # https://www.gnu.org/software/gawk/
    brew install gnu-sed            # https://www.gnu.org/software/sed/
    brew install grep               # https://www.gnu.org/software/grep/

    # General Commands
    brew install bat                # https://github.com/sharkdp/bat
    brew install figlet             # http://www.figlet.org/
    brew install git                # https://git-scm.com
    brew install jc                 # https://github.com/kellyjonbrazil/jc
    brew install jq                 # https://github.com/stedolan/jq
    brew install moreutils          # https://joeyh.name/code/moreutils/
    brew install nkf                # https://osdn.net/projects/nkf/
    brew install pwgen              # https://pwgen.sourceforge.io/
    brew install rlwrap             # https://github.com/hanslub42/rlwrap
    brew install tig                # https://github.com/jonas/tig
    brew install watch              # https://gitlab.com/procps-ng/procps

    # Programming Languages
    brew install gauche             # https://practical-scheme.net/gauche/
    brew install ghc                # https://haskell.org/ghc/
    brew install go                 # https://go.dev/
    brew install php                # https://www.php.net/
    brew install python@3.10        # https://www.python.org/
    brew install rbenv              # https://github.com/rbenv/rbenv#readme

    # Others
    brew install semgrep            # https://semgrep.dev

### pip でインストールする

    pip install virtualenv          # https://virtualenv.pypa.io/

### dotfiles をセットアップする

    sed -ie '$a source "$(pwd)/dotfiles/.bashrc"' ~/.bashrc
    install -T {"$(pwd)"/dotfiles,~}/.gitconfig
    install -T {"$(pwd)"/dotfiles,~}/.screenrc
    install -T {"$(pwd)"/dotfiles,~}/.vimrc
    install -T {"$(pwd)"/dotfiles,~}/.docker/config.json

