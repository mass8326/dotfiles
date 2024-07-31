# cd is needed to prevent corepack from triggering on "packageManager"
(( $+commands[pnpm] )) && source <(cd /tmp && pnpm completion zsh)
