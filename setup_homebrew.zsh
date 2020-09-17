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
# export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
# https://github.com/Homebrew/homebrew-bundle/issues/474

# HOMEBREW_CASK_OPTS is exported in `zshenv` with
# `--no-quarantine` and `--no-binaries` options,
# which makes them available to Homebrew for the
# first install (before our `zshrc` is sourced).

brew bundle --verbose

# Should we wrap this in a conditional?
echo "Enter superuser (sudo) password to accept Xcode license"
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch


echo "Installing VS Code Extensions"
cat vscode_extensions | xargs -L 1 code --install-extension


# This works to solve the Insecure Directories issue:
# compaudit | xargs chmod go-w
# But this is from the Homebrew site, though `-R` was needed:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
chmod -R go-w "$(brew --prefix)/share"


