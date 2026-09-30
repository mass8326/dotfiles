function tmr() {
  if [ -n "$TMUX" ]; then
    eval $(tmux show-environment -s)
    echo 'Env vars synced from tmux parent!'
  else
    echo '$TMUX was not detected in your current shell!'
  fi
}
