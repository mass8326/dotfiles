# https://wiki.archlinux.org/title/Bash/Prompt_customization
# https://wiki.archlinux.org/title/Zsh#Prompts
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# https://medium.com/@seport/writing-zsh-themes-a-quickref-4c98fdc5ddea

autoload -Uz add-zsh-hook
add-zsh-hook precmd mass-precmd

# Print information above actual prompt
# Keep in mind that *_prompt_info functions will not work here
function mass-precmd() {
  local user="%B%F{green}%n@%m%f%b"
  local dirname="%B%F{blue}%1~%f%b"
  local left="${user} ${dirname}"

  local fulldir="%B%F{magenta}%/%f%b"
  local level="%(2L.%F{yellow}[%L] %f.)"
  local clock="%B%F{cyan}[%D{%H:%M:%S}]%f%b"
  local right="${fulldir} ${level}${clock}"

  print -rP "$(fill-line ${left} ${right})"
}

# Left side prompt
PS1='$(vi_mode_prompt_info)%(!.#.$)%f '
# Right side prompt
RPS1='%(?.%F{green}.%F{red})%? -$(virtualenv_prompt_info)$(git_prompt_info)'
# Multi-line prompt
PS2='%F{yellow}>%f '

# vi_mode_prompt_info
MODE_INDICATOR="%F{red}"
INSERT_MODE_INDICATOR="%F{yellow}"
VI_MODE_SET_CURSOR=true

# git_prompt_info
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%F{yellow}"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f "

# virtualenv_prompt_info
ZSH_THEME_VIRTUALENV_PREFIX="%F{magenta}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%f "
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{purple}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%f"

# Pads between two strings with spaces up to available columns
# Third argument can be used to adjust padding for weird characters
function fill-line() {
  local adjust="${3:-0}"
  local llen="$(prompt-length $1)"
  local rlen="$(prompt-length $2)"
  local pad="$((COLUMNS - llen - rlen + adjust - 1))"
  echo "${1}${(l.$pad.. .)}${2}"
}

# Returns the length that a prompt will evaluate to
function prompt-length() {
  emulate -L zsh
  local COLUMNS=${2:-$COLUMNS}
  local -i x y=$#1 m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ));
    done
    local xy
    while (( y > x + 1 )); do
      m=$(( x + (y - x) / 2 ))
      typeset ${${(%):-$1%$m(l.x.y)}[-1]}=$m
    done
  fi
  echo $x
}
