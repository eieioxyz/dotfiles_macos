# dotfiles

I'm learning about dotfiles at [dotfiles.eieio.xyz](http://dotfiles.eieio.xyz).


## TODO
- Git clone / SSH


## Decommission Computer

[Create a bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).

Software audit:
- Uninstall unwanted software (e.g. GarageBand, iMovie, Keynote, Numbers, Pages)
- Install missing software (look at `/Applications`, panes in System Preferences , maybe `~/Applications`, etc.)

Backup / sync files:
- Commit and Push to remote repositories
- Time Machine
- Dropbox / Google Drive
- Manual Backups (external drives, redundant cloud services)
- Contacts, Photos, Calendar, Messages (Google, iCloud)
- etc.

Deactivate licenses:
- Dropbox (`Preferences > Account > Unlink`)
- ScreenFlow (`Preferences > Licenses > Deactivate`)
- Sign Out of App Store (`Menu > Store > Sign Out`)
- iTunes, etc.


## Restore Instructions

1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. `git clone https://github.com/eieioxyz/dotfiles_macos.git ~/.dotfiles`. We'll start with `https` but switch to `ssh` after everything is installed.
3. `cd ~/.dotfiles`
4. If necessary, `git checkout <another_branch>`.
5. Do one last Software Audit by editing [Brewfile](Brewfile) directly.
6. [`./install`](install)
7. Restart computer.
8. Setup up Dropbox (use multifactor authentication!) and allow files to sync before setting up dependent applications. Alfred settings are stored here.
9. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), add to GitHub, and switch remotes.

    ```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t rsa -b 4096 -C "66495007+eieioxyz@users.noreply.github.com"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa
    EOF

    # Add private key to ssh-agent 
    ssh-add -K ~/.ssh/id_rsa

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_rsa.pub

    # Test SSH connection, then verify fingerprint and username
    # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
    ssh -T git@github.com

    # Switch from HTTPS to SSH
    git remote set-url origin git@github.com:eieioxyz/dotfiles_macos.git
    ```


### Manual Steps

#### Snappy App

1. `System Preferences > Keyboard > Shortcuts > Screenshots > Save picture of selected area as a file (cmd+shift+4)` uncheck.
2. `Snappy Preferences > General > Take snap` change from `cmd+shift+2` (which conflicts with ScreenFlow) to `cmd+shift+4`.

#### Alfred

1. `System Preferences > Keyboard > Shortcuts > Spotlight > Show Spotlight search (cmd+space)` uncheck.
2. `Alfred Preferences > Powerpack` add License.
3. `Alfred Preferences > General > Request Permissions`.
4. `Alfred Preferences > General > Alfred Hotkey` change to `cmd+space`.
5. `Alfred Preferences > Advanced > Set preferences folder` and set to `~/Dropbox/dotfiles/Alfred`.

#### Terminal

1. `mackup restore`

#### VS Code

We will have to do something with `code --install-extension` and our [vscode_extensions](vscode_extensions) (which are created with `code --list-extensions > vscode_extensions`).


