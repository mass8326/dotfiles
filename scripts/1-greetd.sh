set -e

packages=(
  greetd
  uwsm
  hyprland
)

paru -S --needed ${packages[@]}

sudo systemctl enable greetd
sudo tee /etc/greetd/config.toml &> /dev/null <<EOF
[terminal]
vt = 1
[default_session]
command = "uwsm start hyprland-uwsm.desktop"
user = "mass"
EOF
