# https://wiki.archlinux.org/title/Bash/Prompt_customization
# https://wiki.archlinux.org/title/Zsh#Prompts
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# https://medium.com/@seport/writing-zsh-themes-a-quickref-4c98fdc5ddea

VI_MODE_SET_CURSOR=true
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%F{yellow}"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f "
ZSH_THEME_VIRTUALENV_PREFIX="%F{magenta}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%f "
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{purple}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%f"

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt

function set-prompt() {
  # local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  # branch=${${branch//\%/%%}/\\/\\\\\\}

  local privilege="%F{yellow}%(!.#.$)%f"
  local user="%B%F{green}%n@%m%f%b"
  local level="%(2L. %B%F{magenta}[%L]%f%b.)"
  local dirname="%B%F{blue}%1~%f%b"
  local fulldir="%B%F{magenta}%/%f%b"
  local code="%(?.%F{green}.%F{red})%? -%f"

  local topl="${user} ${dirname}${level} $(git_prompt_info)"
  local topr="${fulldir}"
  local top="$(fill-line ${topl} ${topr})"
 
  PS1="${top}"$'\n'"${privilege} "
  PS2='%F{yellow}>%f '
  RPS1="$code %B%F{cyan}%D{%H:%M:%S}%f%b"
}

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
