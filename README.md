# dotfiles

## INSTALL (Mac)

### Homebrew で必要なパッケージをインストールする

    # Bash
    brew install bash-completion

    # General Commands
    brew install coreutils
    brew install diffutils
    brew install findutils
    brew install gawk
    brew install gnu-sed
    brew install grep
    brew install rlwrap
    brew install jq
    brew install git
    brew install tig
    brew install watch
    brew install pwgen
    brew install figlet
    brew install nkf

    # Programming Languages
    brew install gauche
    brew install python
    brew install elm
    brew install rbenv

### リポジトリを clone し, bashrc を上書きする

    git clone git@github.com:suzuki-kei/dotfiles.git
    sed -ie '$a source $(pwd)/dotfiles/.bashrc' ~/.bashrc

## INSTALL (Linux)

### XXX で必要なパッケージをインストールする

    TODO ディストリビューションごとに記載する.

### リポジトリを clone し, bashrc を上書きする

    git clone git@github.com:suzuki-kei/dotfiles.git
    sed -ie '$a source $(pwd)/dotfiles/.bashrc' ~/.bashrc

