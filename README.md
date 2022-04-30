# dotfiles

## セットアップ

### Homebrew をインストールする (Mac only)

以下のページを参照:

    https://brew.sh/

### Homebrew でインストールする (Mac only)

    bash brew-install.sh

### pip でインストールする

    pip3 install virtualenv # https://virtualenv.pypa.io/

### dotfiles をセットアップする

    sed -ie '$a source "$(pwd)/dotfiles/.bashrc"' ~/.bashrc
    install -T {"$(pwd)"/dotfiles,~}/.gitconfig
    install -T {"$(pwd)"/dotfiles,~}/.screenrc
    install -T {"$(pwd)"/dotfiles,~}/.vimrc
    install -T {"$(pwd)"/dotfiles,~}/.docker/config.json

## メンテナンス

### Homebrew

    # 最新情報を取得する.
    brew update

    # バージョンアップする.
    brew upgrade

    # 不要ファイルを削除する.
    brew autoremove
    brew cleanup --prune=all

### pip をバージョンアップする

    pip3 install --upgrade pip

