#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

if exists brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi



# TODO: Keep an eye out for a different `--no-quarantine` solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474

brew bundle --verbose

# Should we wrap this in a conditional?
echo "Enter password to accept Xcode license"
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch


