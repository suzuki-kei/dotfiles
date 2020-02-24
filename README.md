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
    brew install tig
    brew install watch

    # Programming Languages
    brew install gauche

### リポジトリを clone し, bashrc を上書きする

    git clone git@github.com:suzuki-kei/dotfiles.git
    cd dotfiles
    ln -sf "$(pwd)/.bashrc-mac" "~/.bashrc"

## INSTALL (Linux)

### XXX で必要なパッケージをインストールする

    TODO ディストリビューションごとに記載する.

### リポジトリを clone し, bashrc を上書きする

    git clone git@github.com:suzuki-kei/dotfiles.git
    cd dotfiles
    ln -sf "$(pwd)/.bashrc" "~/.bashrc"

