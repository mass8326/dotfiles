# Pick a preset command (e.g. ssh with specific flags) via fzf and run it.
# Presets are newline-delimited in $FZH_PRESETS (default ~/.config/fzh-presets).
# Blank lines and lines starting with '#' are ignored.

function fzh() {
  local presets=${FZH_PRESETS:-$HOME/.config/fzh-presets}

  if [[ $+commands[fzf] != 1 ]]; then
    echo "Error: Could not find executable 'fzf'"
    return 1
  fi

  if [[ ! -f $presets ]]; then
    echo "Error: Presets file '$presets' not found"
    return 1
  fi

  local entries=$(grep -Ev '^[[:space:]]*(#|$)' $presets)
  if [[ -z $entries ]]; then
    echo "Error: No presets found in '$presets'"
    return 1
  fi

  local cmd=$(echo $entries | fzf --cycle --prompt="Command 󰄾 " --height ~50% --layout=reverse --border --query="$*")
  if [[ -z $cmd ]]; then
    echo "Exit: You didn't select a command"
    return 1
  fi

  print -s $cmd
  eval $cmd
}

# Append a command to the presets file, folding newlines into spaces.
function fzh-add() {
  local presets=${FZH_PRESETS:-$HOME/.config/fzh-presets}
  # Drop line continuations, then fold remaining newlines into spaces
  local cmd=${${*//\\$'\n'/ }//$'\n'/ }

  if [[ -z ${cmd//[[:space:]]/} ]]; then
    "${EDITOR}" "${presets}"
    return $?
  fi

  mkdir -p ${presets:h} || return 1
  # Make sure the new entry starts on its own line
  # ($(...) strips a trailing newline, so non-empty output means none was there)
  if [[ -s $presets && -n $(tail -c1 $presets) ]]; then
    echo >> $presets
  fi
  print -r -- $cmd >> $presets
  print -r -- "Added to '$presets': $cmd"
}
