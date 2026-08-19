set -eu

arch=(
  chezmoi
  greetd
  ncdu
  nvim
  tmux
  zsh
)
pacman -S --needed ${arch[@]}

nix=(
  nixpkgs#direnv
  nixpkgs#nix-direnv
)
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
nix profile add ${nix[@]}

timedatectl set-local-rtc true
sudo systemctl enable greetd
sudo timedatectl set-local-rtc true
sudo tee /etc/greetd/config.toml <<EOF
[terminal]
vt = 1
[default_session]
command = "agreety --cmd /bin/zsh"
user = "greeter"
EOF

chezmoi init --apply mass8326
chsh -s /bin/zsh
