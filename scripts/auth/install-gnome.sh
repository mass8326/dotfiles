set -e

packages=(
  gnome-keyring
)

paru -S --needed ${packages[@]}

systemctl --user enable --now gnome-keyring-daemon

pam_module="greetd"
if grep -q "pam_gnome_keyring.so" "/etc/pam.d/$pam_module"; then
  echo "Skipping gnome-keyring installation into '/etc/pam.d/$pam_module'..."
else
  echo "Installing gnome-keyring into '/etc/pam.d/$pam_module'..."
  sudo tee -a "/etc/pam.d/$pam_module" &> /dev/null << EOF
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
EOF
fi

