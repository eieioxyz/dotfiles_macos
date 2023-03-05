#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions are managed with `n`, which is in the Brewfile.
# See `zshenv` for the setting of the `N_PREFIX` variable,
# thus making it available below during the first install.
# See `zshrc` where `N_PREFIX/bin` is added to `$path`.

N_NODE=$N_PREFIX/bin/node
N_NPM=$N_PREFIX/bin/npm

if exists $N_NODE; then
  echo "Node $($N_NODE --version) & NPM $($N_NPM --version) already installed with n"
else
  echo "Installing Node & NPM with n..."
  n latest
fi


# Install Global NPM Packages
# $N_NPM install --global firebase-tools
# $N_NPM install --global @angular/cli
# $N_NPM install --global @ionic/cli
# $N_NPM install --global typescript
# $N_NPM install --global json-server
# $N_NPM install --global http-server
$N_NPM install --global trash-cli
# $N_NPM install --global json5

echo "Global NPM Packages Installed:"
$N_NPM list --global --depth=0
