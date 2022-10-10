# dotfiles

## セットアップ

### Homebrew をインストールする (Mac only)

以下のページを参照:

    https://brew.sh/

### Homebrew でパッケージをインストールする (Mac only)

    bash brew-install.sh

### pip でパッケージをインストールする

    pip3 install virtualenv # https://virtualenv.pypa.io/

### go でパッケージをインストールする

    go install golang.org/x/tools/cmd/godoc@latest

### dotfiles をセットアップする

    sed -ie '$a source "$(pwd)/dotfiles/.bashrc"' ~/.bashrc
    install -T {"$(pwd)"/dotfiles,~}/.gitconfig
    install -T {"$(pwd)"/dotfiles,~}/.screenrc
    install -T {"$(pwd)"/dotfiles,~}/.vimrc
    install -T {"$(pwd)"/dotfiles,~}/.docker/config.json

## 各種手順

### パスワードを生成する

    pwgen -1cnysv 16 1

## メンテナンス

    laziness-maintenance

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

