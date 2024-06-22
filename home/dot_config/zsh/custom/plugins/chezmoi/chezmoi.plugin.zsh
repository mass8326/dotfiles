[[ $+commands[chezmoi] ]] || return 0

source <(chezmoi completion zsh)

alias ch="chezmoi"
alias che="chezmoi edit"
alias chd="chezmoi diff"
alias cha="chezmoi apply --verbose"
alias chea="chezmoi edit --apply --verbose"
alias chcd="chezmoi cd"
alias chgst="chezmoi git status"
alias chga="chezmoi git add"
alias chgaa="chezmoi git add --all"
alias chgc="chezmoi git commit"
alias chgp="chezmoi git push"
