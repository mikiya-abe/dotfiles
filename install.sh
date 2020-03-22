#!/bin/sh

echo "======== Start to install... ========"

if [[ `uname` == "Darwin" ]]; then
    # Command Line Tools
    if ! which xcode-select --install >/dev/null 2>&1 ; then
        echo "Downloading Command Line Tools ..."
        xcode-select --install
    fi

    #HomeBrew
    if ! which brew >/dev/null 2>&1 ; then
        echo "Downloading HomeBrew ..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # Brewfileを使ってもろもろインストール
    brew install caskroom/cask/brew-cask
    brew tap Homebrew/bundle
    brew bundle
fi

# Powerline fonts
echo "=== Downloading Powerline fonts... ==="
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "======== Finished installing! ========"
