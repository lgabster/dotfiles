#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
#brew install coreutils

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install dark-mode
brew install git-lfs
brew install imagemagick --with-webp
#brew install lua
#brew install speedtest_cli
brew install tree
brew install webkit2png
brew install calc
brew install geoip
brew install unrar
brew install wget


# Install apps
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install skype
brew cask install dropbox
brew cask install 1password
brew cask install dropbox
brew cask install vlc
brew cask install cheatsheet
brew cask install sourcetree
brew cask install tunnelblick
brew cask install bartender
brew cask install firefox
brew cask install parallels-desktop
brew cask install utorrent

brew cask install bettertouchtool
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webpquicklook
brew cask install suspicious-package
brew cask install docker-toolbox
brew cask install spotify

# Remove outdated versions from the cellar.
brew cleanup
