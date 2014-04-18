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
plugins=(git autojump gradle zsh-syntax-highlighting npm lein)

# Oh my zsh export
source $ZSH/oh-my-zsh.sh

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

export JDK_HOME="/usr/lib/jvm/java-7-oracle"
export EDITOR="vim"
