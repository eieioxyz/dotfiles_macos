```zsh
# After you've set these in system preferences,
# you can read them with `defaults`.
% defaults read NSGlobalDomain KeyRepeat
2

% defaults read NSGlobalDomain InitialKeyRepeat
15

# These are integers (but they are labels representing
# other durations, and they can't be floats).
% defaults read-type NSGlobalDomain KeyRepeat
Type is integer

% defaults read-type NSGlobalDomain InitialKeyRepeat
Type is integer

# You can set them via command line or script file.
% defaults write NSGlobalDomain KeyRepeat -int 2
% defaults write NSGlobalDomain InitialKeyRepeat -int 15

# You can go a little faster than the GUI allows,
# and need to restart to see the changes.
% defaults write NSGlobalDomain KeyRepeat -int 1
% defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Here's a related setting which turns off the 
# menu of accent marks and special characters.
% defaults write -g ApplePressAndHoldEnabled -bool false
```