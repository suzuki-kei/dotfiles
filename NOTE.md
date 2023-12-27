# NOTE

## [Linux] パスワードを生成する

    pwgen -1cnysv 16 1

## [Mac] Launchpad の並び順をリセットする

    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock

## [Mac] Chrome で常にシークレットモードにする

    # シークレットモードで起動する.
    open -n -a "Google Chrome" --args --incognito "https://example.com"

    # 常にシークレットモードにする.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 2
    sudo reboot

    # 元に戻す.
    defaults write com.google.Chrome.plist IncognitoModeAvailability -integer 0
    sudo reboot

