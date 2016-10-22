#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Oh-My-Zsh
brew install zsh zsh-completions
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install & setting up Git
git config --global user.name "lgabster"
git config --global user.email "lgabster@gmail.com"
git config --global credential.helper osxkeychain
git config --global mergetool.sublime.cmd "subl -w \$MERGED"
git config --global mergetool.sublime.trustExitCode false
git config --global merge.tool sublime
git mergetool -y

# Install & setting up Sublime Text
brew cask install sublime-text

# Install & setting up NodeJs
brew install node
npm install -g grunt-cli

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc

git pull origin master;

function doIt() {

    sh ./brew.sh
    sh ./macos.sh

    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "macos.sh" \
        --exclude "brew.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        -avh --no-perms . ~;
    source ~/.zshrc;


    # Kill affected applications
    for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
        "Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
        "Photos" "Safari" "SystemUIServer" "iCal"; do
        killall "${app}" &> /dev/null
    done
    echo "Done. Note that some of these changes require a logout/restart to take effect."
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
