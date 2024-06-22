[[ $+commands[chezmoi] ]] || return 0

source <(chezmoi completion zsh)
alias ch="chezmoi"
alias che="chezmoi edit"
alias chd="chezmoi diff"
alias cha="chezmoi apply --verbose"
alias chea="chezmoi edit --apply --verbose"
alias chcd="chezmoi cd"

[[ $+commands[git] ]] || return 0
source <(alias | awk -F "='" -f "${0:h}/alias.awk")
