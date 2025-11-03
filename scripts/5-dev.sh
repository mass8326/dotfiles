set -e

packages=(
  go
  pulumi
  rustup
)

paru -S --needed ${packages[@]}

rustup default stable

RUSTFLAGS='-C target-cpu=native' cargo install fnm
. <(fnm env)
fnm install --lts

go install github.com/rhysd/actionlint/cmd/actionlint@latest
