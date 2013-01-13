# ------------------------------------------------------------------------
# Juan G. Hurtado oh-my-zsh theme
# (Needs Git plugin for current_branch method)
# ------------------------------------------------------------------------

local default_username='kaener'
local default_host='vika'


# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
CYAN=$fg[cyan]
MAGENTA=$fg[magenta]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
CYAN_BOLD=$fg_bold[cyan]
MAGENTA_BOLD=$fg_bold[magenta]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$MAGENTA_BOLD%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Only show username if not default
username() {
	if [[ $USER != $default_username || $HOST != $default_host ]]; then echo '%n@%m:'; fi
}

time="%(?.%{$GREEN%}.%{$RED%})<%*>%{$RESET_COLOR%}"

# Prompt format
PROMPT='
%{$GREEN_BOLD%}`username`%{$BLUE_BOLD%}%~%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
%{$BLUE%}❱%{$RESET_COLOR%} '

RPROMPT='%{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)%{$RESET_COLOR%}'
