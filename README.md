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

### パスワードを生成する

    pwgen -1cnysv 16 1

### Homebrew (Mac only)

    # 最新情報を取得する.
    brew update

    # バージョンアップする.
    brew upgrade

    # 不要ファイルを削除する.
    brew autoremove
    brew cleanup --prune=all

### Docker

    # 未使用のイメージを削除する.
    docker image prune

### pip をバージョンアップする

    pip3 install --upgrade pip

### Launchpad の並び順をリセットする (Mac only)

    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock

### Chrome で常にシークレットモードにする (Mac only)

    # シークレットモードで起動する.
    open -n -a "Google Chrome" --args --incognito "https://example.com"

    # 常にシークレットモードにする.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 2
    sudo reboot

    # 元に戻す.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 0
    sudo reboot

