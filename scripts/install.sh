set -e

packages=(
  chezmoi
  greetd
  ncdu
  nvim
  tmux
  zsh
)

paru -S --needed ${packages[@]}

timedatectl set-local-rtc true
=======
sudo systemctl enable greetd
sudo timedatectl set-local-rtc true
sudo tee /etc/greetd/config.toml <<EOF
[terminal]
vt = 1
[default_session]
command = "agreety --cmd /bin/zsh"
user = "greeter"
EOF
