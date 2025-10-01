alias rt='cd $(git rev-parse --show-toplevel)'

# Global variables for passing between functions:
# $_rt_package
# $_rt_script

function rtf() {
  _rtfn_get_package ./*/ || return 1
  local dir=$(dirname $_rt_package)
  local cmd="cd $dir"
  print -s $cmd
  eval $cmd
}

function rtft() {
  if [[ $TERM_PROGRAM = "WezTerm" ]]; then
    _rtfn_get_package ./*/ || return 1
    local dir=$(dirname $_rt_package)
    wezterm cli spawn --cwd $dir
  else
    echo "Supported terminal not detected, falling back to 'rtc'"
    rtc
  fi
}

function rts() {
  if [[ -f "package.json" ]]; then
    _rt_package="package.json"
  else
    _rtfn_get_package . || return 1
  fi

  _rtfn_get_script $_rt_package || return 1

  local dir=$(dirname $_rt_package)
  if [[ $dir = "." ]]; then
    local cmd="pnpm run $_rt_script"
  else
    local cmd="(cd $dir && pnpm run $_rt_script)"
  fi
  print -s $cmd
  eval $cmd
}

function _rtfn_get_script() {
  if [[ $+commands[jq] != 1 ]]; then
    echo "Error: Could not find executable 'jq'"
    return 1
  fi

  local raw=$(cat $1 | jq .scripts | sed '1d;$d' | fzf --prompt="$1 script 󰄾 " --height ~50% --layout=reverse --border)
  if [[ -z $raw ]]; then
    echo "Exit: You didn't select a package.json script"
    return 1
  fi

  _rt_script=$(echo $raw | awk -F ': ' '{gsub(/[" ]/, "", $1); print $1}')
}

function _rtfn_get_package() {
  if [[ $+commands[fd] != 1 ]]; then
    echo "Error: Could not find executable 'fd'"
    return 1
  fi

  local result=$(fd '(package.json|go.mod)' $@ | awk '{print gsub("/", "/") " " $0}' | sort -nr | cut -d' ' -f2-)
  if [[ -z $result ]]; then
    echo "Error: No child packages or modules found"
    return 1
  else
    _rt_package=$(echo $result | fzf --prompt="package.json location 󰄾 " --height ~50% --layout=reverse --border --tac --select-1)
  fi

  if [[ -z $_rt_package ]]; then
    echo "Exit: You didn't select a package.json file"
    return 1
  fi
}
