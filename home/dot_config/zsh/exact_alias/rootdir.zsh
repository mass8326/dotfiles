alias rt='cd $(git rev-parse --show-toplevel)'

function rtc() {
  _rt_get_package ./*/*
  local dir=$(dirname $package)
  cmd="cd $dir"
  print -s $cmd
  eval $cmd
}

function rtr() {
  if [[ $+commands[jq] != 1 ]]; then
    echo "Error: Could not find executable 'jq'"
    return 1
  fi

  _rt_get_package .
  
  local scripts=$(cat $package | jq .scripts | sed '1d;$d' | fzf --prompt="$package script 󰄾 " --height ~50% --layout=reverse --border)
  if [[ -z $scripts ]]; then
    echo "Exit: You didn't select a package.json script"
    return 1
  fi
  
  local dir=$(dirname $package)
  local script=$(echo $scripts | awk -F ': ' '{gsub(/[" ]/, "", $1); print $1}')
  if [[ $dir = "." ]]; then
    cmd="pnpm run $script"
  else
    cmd="(cd $dir && pnpm run $script)"
  fi
  print -s $cmd
  eval $cmd
}

function _rt_get_package() {
  local packages=$(find $@ -type d \( -name node_modules -o -path '*/.*' \) -prune -o -name package.json -print)
  if [[ -z $packages ]]; then
    echo "Error: There's no child 'package.json'"
    return 1
  else
    package=$(echo $packages | fzf --prompt="package.json location 󰄾 " --height ~50% --layout=reverse --border --tac --select-1)
  fi

  if [[ -z $package ]]; then
    echo "Exit: You didn't select a package.json file"
    return 1
  fi
}
