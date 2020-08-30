# dotfiles

I'm learning about dotfiles at [dotfiles.eieio.xyz](http://dotfiles.eieio.xyz).


## TODO
- Git clone / SSH


## Decommission Computer

[Create a bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).

Backup / sync files:
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

Actual restore instructions coming soon...


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


