set -e

packages=(
  bitwarden
  brave-bin
  discord
  docker
  docker-buildx
  docker-compose
  foot
  gnome-themes-extra
  go
  rustup
  spotify-launcher
  visual-studio-code-bin
  vlc
  vlc-plugins-all
)

paru -S --needed ${packages[@]}

rustup default stable

RUSTFLAGS='-C target-cpu=native' cargo install fnm
PATH="$PATH:$HOME/.cargo/bin"
. <(fnm env)
fnm install --lts

go install github.com/rhysd/actionlint/cmd/actionlint@latest

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

sudo systemctl enable --now docker.socket
