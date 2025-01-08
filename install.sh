#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


./script/macos.sh
./script/brew.sh
# ./script/vscode.sh
# ./script/intellij_idea.sh
./script/symlink.sh


echo "Installation Complete!"