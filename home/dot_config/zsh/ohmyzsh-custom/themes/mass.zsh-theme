# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/

local user="%B%F{green}%n@%m%f%b"
local dir="%B%F{blue}%c%f%b"
local privilege="%(!.#.$)"

# Standard prompt
PROMPT='$(virtualenv_prompt_info)${user} ${dir} $(git_prompt_info)$(vi_mode_prompt_info) %{$reset_color%}'

# New line prompt
# PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# Right side prompt
local full_dir="%F{blue}%~%f"
local exit_code="%F{red}%? ↵%f"
RPS1='%(?.${full_dir}.${exit_code})%{$reset_color%}'

# virtualenv_prompt_info
ZSH_THEME_VIRTUALENV_PREFIX="%F{magenta}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%f "

# vi_mode_prompt_info
MODE_INDICATOR="%F{red}${privilege}%f"
INSERT_MODE_INDICATOR="%F{white}${privilege}%f"
VI_MODE_SET_CURSOR=true

# git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%F{yellow}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{purple}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%f"
