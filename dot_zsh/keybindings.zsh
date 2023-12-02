# a lot of this is lifted from oh-my-zsh, because I'm used to it
# (src: https://github.com/ohmyzsh/ohmyzsh/blob/e11d81303753b0fefbc50ce10ec4612c7ff33e84/lib/key-bindings.zsh)

zmodload -i zsh/complist

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use vi key bindings
bindkey -v

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# ctrl-z to run 'fg'
# (src: https://github.com/ohmyzsh/ohmyzsh/blob/e11d81303753b0fefbc50ce10ec4612c7ff33e84/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^z' fancy-ctrl-z

# ensure atuin search binding works in vim insert mode
bindkey -M viins "^r" _atuin_search_widget

# edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins '\C-x\C-e' edit-command-line

# allow shift-tab to go back in menu
# (src: https://unix.stackexchange.com/a/84869)
bindkey -M menuselect '^[[Z' reverse-menu-complete

# allow alt+. to insert last word from the previous command in vim insert mode
# (src: https://unix.stackexchange.com/a/696981)
bindkey -M viins '\e.' insert-last-word

# Ctrl-Q temporarily hides the current command
# have to explicitly add the binding for the vim insert mode
# (src: https://stackoverflow.com/a/16777568)
unsetopt flow_control
bindkey -M viins '^Q' push-line
