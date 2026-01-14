# dotfiles

## Install

(1) homebrew をインストールする

 * homebrew (https://brew.sh/)

(2) セットアップスクリプトを実行する

    bash setup/setup.sh

(3) 環境変数を設定する

    vi ~/.bashrc
    # export GITHUB_OPEN_COMMAND=g
    # export G_DEFAULT_URL='https://www.google.com'

(4) .bashrc を読み込む

    source ~/.bashrc

(5) cabal でライブラリをインストールする

    cabal update
    cabal install --lib HUnit
    cabal install --lib random
    cabal install fourmolu

TODO setup/setup.sh に組み込む

## Maintenance

    laziness-maintenance

