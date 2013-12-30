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
plugins=(git autojump zsh-syntax-highlighting npm)

# Oh my zsh export
source $ZSH/oh-my-zsh.sh

# Functions export
source $HOME/.functions

# Aliases export
source $HOME/.aliases

# Use fancy ZSH completion
zstyle ':completion:*' expand prefix suffix

# Workaround for this bug in xfce4-terminal: https://bugs.launchpad.net/ubuntu/+source/xfce4-terminal/+bug/778801
# where TERM always set to 'xterm' ignoring preferences
if [ \( "x$COLORTERM" = "xgnome-terminal" -o "x$COLORTERM" = "xTerminal" -o "x$COLORTERM" = "xxfce4-terminal" \) -a "x$TERM" = "xxterm" ] && infocmp xterm-256color >/dev/null 2>&1; then
    TERM=xterm-256color
fi

export JDK_HOME="/usr/lib/jvm/java-7-oracle"
