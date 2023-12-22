# dotfiles

## セットアップ

### Homebrew をインストールする (Mac only)

以下のページを参照:

    https://brew.sh/

### セットアップスクリプトを実行する

    bash setup/setup.sh

## 各種手順

### パスワードを生成する

    pwgen -1cnysv 16 1

## メンテナンス

    laziness-maintenance

### Chrome で常にシークレットモードにする (Mac only)

    # シークレットモードで起動する.
    open -n -a "Google Chrome" --args --incognito "https://example.com"

    # 常にシークレットモードにする.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 2
    sudo reboot

    # 元に戻す.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 0
    sudo reboot

