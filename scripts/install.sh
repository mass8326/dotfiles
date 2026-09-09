set -eu

arch=(
  chezmoi
  greetd
  ncdu
  noctalia-greeter
  nvim
  tmux
  zsh
)
sudo pacman -Syu --needed ${arch[@]}

sudo systemctl enable --now greetd
sudo useradd --system --shell /usr/bin/nologin --home-dir /var/lib/noctalia-greeter greeter 2>/dev/null || true
sudo cp -a /etc/greetd/config.toml /etc/greetd/config.toml.bak 2>/dev/null || true
sudo tee /etc/greetd/config.toml >/dev/null <<'EOF'
[terminal]
vt = 1

[default_session]
command = "/usr/bin/noctalia-greeter-session"
user = "greeter"
EOF

sudo timedatectl set-local-rtc true # Improve compatibility with Windows dual boot

chezmoi init --apply mass8326
sudo chsh --shell /bin/zsh
