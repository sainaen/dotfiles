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
plugins=(git debian npm coffee cake autojump extract zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Enable colors in terminal
TERM="xterm-256color"
