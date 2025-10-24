set -e

packages=(
  # Authentication
  gnome-keyring
  # Appearance
  gnome-themes-extra
  nwg-look
  xdg-desktop-portal-gtk
  # Applications
  file-roller
  gnome-disk-utility
  gnome-text-editor
  impression
  loupe
  nautilus
  # Extensions
  gvfs-mtp
  gvfs-smb
)

paru -S --needed ${packages[@]}

systemctl --user enable --now gnome-keyring-daemon

if grep -q "pam_gnome_keyring.so" /etc/pam.d/greetd; then
  echo 'Skipping gnome-keyring installation into "/etc/pam.d/greetd"...'
else
  echo 'Installing gnome-keyring into "/etc/pam.d/greetd"...'
  sudo tee -a /etc/pam.d/greetd &> /dev/null << EOF
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
EOF
fi

