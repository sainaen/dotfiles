# based on: https://github.com/ohmyzsh/ohmyzsh/blob/e11d81303753b0fefbc50ce10ec4612c7ff33e84/lib/completion.zsh

# enable a menu UI
zstyle ':completion:*:*:*:*:*' menu select

# do not autoselect the first completion entry
setopt nomenu_complete
# show menu on second Tab press
setopt auto_menu
# 'cd' does not select the parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd


# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit
