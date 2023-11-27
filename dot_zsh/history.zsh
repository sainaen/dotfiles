HISTFILE="$HOME/.zsh_history"

# hoard *ALL* history
HISTSIZE=5000000
SAVEHIST=5000000

# zsh history configuration
# (src: https://github.com/ohmyzsh/ohmyzsh/blob/e11d81303753b0fefbc50ce10ec4612c7ff33e84/lib/history.zsh)
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# use atuin (with default zsh search on Up/Down, see ./keybindings.zsh)
eval "$(atuin init zsh --disable-up-arrow)"
