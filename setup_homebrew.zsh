#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install httpie
brew install bat

brew cask install --no-quarantine google-chrome
brew cask install --no-quarantine visual-studio-code
brew cask install --no-quarantine alfred