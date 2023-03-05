# echo "hello from zshrc $0"
# Set Variables
export NULLCMD=bat
export DOTFILES="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
# export NX_VERBOSE_LOGGING=true

# Change ZSH Options

# Adjust History Variables & Options
[[ -z $HISTFILE ]] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000 # Session Memory Limit
SAVEHIST=4000 # File Memory Limit
setopt histNoStore
setopt extendedHistory
setopt histIgnoreAllDups
unsetopt appendHistory # explicit and unnecessary
setopt incAppendHistoryTime

# Line Editor Options (Completion, Menu, Directory, etc.)
# autoMenu & autoList are on by default
setopt autoCd
setopt globDots


# Create Aliases
alias ls='exa'
alias exa='exa -laFh --git'
alias trail='<<<${(F)path}'
alias ftrail='<<<${(F)fpath}'
alias rm=trash
alias man=batman
alias bbd="brew bundle dump --force --describe"
# Load history into shell (shareHistory alternative)
alias lh='fc -RI; echo "loaded and showing..."; history;'

# Customize Prompt(s)
# PROMPT='%1~ %L %# '
# precmd() { precmd() { echo }}

source "$DOTFILES/spaceship_shlvl.zsh"

SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=0
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  # node          # Node.js section
  exec_time     # Execution time
  line_sep      # Line break
  shlvl         # Custom section from spaceship_shlvl.zsh
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exit_code
  battery
  time
)


# Add Locations to $path Array
typeset -U path

path=(
  "$N_PREFIX/bin"
  # "/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)


# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Prevent non-existing commands from being added to history
zshaddhistory() {
  whence ${${(z)1}[1]} >| /dev/null || return 1
}

# Use ZSH Plugins
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# source antidote
source /usr/local/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load


# ...and Other Surprises

# Change Key Bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Add "zstyles" for Completions & Other Things
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':plugin:history-search-multi-word' clear-on-cancel 'yes'

# Load "New" Completion System
autoload -Uz compinit && compinit


# Load Angular CLI autocompletion.
# source <(ng completion script)
