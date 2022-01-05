# dotfiles

## INSTALL (Mac)

### Homebrew をインストールする

以下のページを参照:

    https://brew.sh/

### Homebrew でインストールする

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
    brew install jq                 # https://github.com/stedolan/jq
    brew install nkf                # https://osdn.net/projects/nkf/
    brew install pwgen              # https://pwgen.sourceforge.io/
    brew install rlwrap             # https://github.com/hanslub42/rlwrap
    brew install tig                # https://github.com/jonas/tig
    brew install watch              # https://gitlab.com/procps-ng/procps

    # Programming Languages
    brew install gauche             # https://practical-scheme.net/gauche/
    brew install ghc                # https://haskell.org/ghc/
    brew install php                # https://www.php.net/
    brew install python@3.10        # https://www.python.org/
    brew install rbenv              # https://github.com/rbenv/rbenv#readme

### pip でインストールする

    pip install virtualenv

### リポジトリを clone し, bashrc を上書きする

    git clone git@github.com:suzuki-kei/dotfiles.git
    sed -ie '$a source $(pwd)/dotfiles/.bashrc' ~/.bashrc

## INSTALL (Linux)

### XXX で必要なパッケージをインストールする

    TODO ディストリビューションごとに記載する.

### リポジトリを clone し, bashrc を上書きする

    git clone git@github.com:suzuki-kei/dotfiles.git
    sed -ie '$a source $(pwd)/dotfiles/.bashrc' ~/.bashrc

