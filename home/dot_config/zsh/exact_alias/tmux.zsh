function tmr() {
  if [ -n "$TMUX" ]; then
    contents="$(tmux show-environment -s)"
    lines="$(echo $contents | wc -l)"
    eval $contents
    echo "$lines env var(s) synced from tmux parent!"
  else
    echo '$TMUX was not detected in your current shell!'
  fi
}
