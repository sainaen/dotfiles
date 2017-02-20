# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to custom folder
ZSH_CUSTOM=$HOME/.zsh-custom

# My own theme
ZSH_THEME="tomorrow"
# second best in base package: ZSH_THEME="juanghurtado"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git autojump zsh-syntax-highlighting) # disabled for now: zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Hoard *ALL* history
HISTSIZE=450000
SAVEHIST=400000 # slightly less, to store dupes

# Oh my zsh export
source $ZSH/oh-my-zsh.sh

# greyish-blue-green
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=66'

# Functions export
source $HOME/.functions

# Aliases export
source $HOME/.aliases

# Use fancy ZSH completion
zstyle ':completion:*' expand prefix suffix

# Not a good idea, but I'm tired of those terminals
# which just don't setup TERM properly. So here it is.
if [[ ! $TERM =~ "^.*256color$" ]]
then
	export TERM=xterm-256color
fi

export JDK_HOME="/usr/lib/jvm/java-8-oracle"
export ELM_HOME="/usr/lib/node_modules/elm/share"
export EDITOR="vim"
export TZ="/usr/share/zoneinfo/Europe/Kiev"
