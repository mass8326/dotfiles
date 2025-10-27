if (( $+commands[fnm] )); then
  # Set up env vars
  . <(fnm env)
  export FNM_COREPACK_ENABLED=true
  # Set up lazy loading of completions
  if [[ ! -f "$ZSH_CACHE_DIR/completions/_fnm" ]]; then
    typeset -g -A _comps
    autoload -Uz _fnm
    _comps[fnm]=_fnm
  fi
  fnm completions --shell=zsh >| "$ZSH_CACHE_DIR/completions/_fnm" &|
fi

if (( $+commands[pnpm] )); then
  # /var/empty will prevent corepack from prompting for user input
  . <(cd /var/empty; pnpm completion zsh)
fi
