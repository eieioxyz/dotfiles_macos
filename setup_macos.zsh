#!/usr/bin/env zsh

echo "\n<<< Starting macOS Setup >>>\n"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > Preferences > General > New Finder windows show:
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/.dotfiles"

# System Preferences > Dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -float 45
defaults write com.apple.dock largesize -float 60
defaults write com.apple.dock autohide -bool true
killall Dock
