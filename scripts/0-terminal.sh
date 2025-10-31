set -e

packages=(
  chezmoi
  nvim
  tmux
  zsh
)

paru -S --needed ${packages[@]}
