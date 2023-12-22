# NOTE

## パスワードを生成する

    pwgen -1cnysv 16 1

## Launchpad の並び順をリセットする (Mac only)

    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock

## Chrome で常にシークレットモードにする (Mac only)

    # シークレットモードで起動する.
    open -n -a "Google Chrome" --args --incognito "https://example.com"

    # 常にシークレットモードにする.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 2
    sudo reboot

    # 元に戻す.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 0
    sudo reboot

