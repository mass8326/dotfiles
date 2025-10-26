set -e

packages=(
  # Authentication
  gnome-keyring
  # Appearance
  gnome-themes-extra
  nwg-look
  xdg-desktop-portal-gtk
  # Applications
  dconf-editor
  file-roller
  gnome-disk-utility
  gnome-text-editor
  impression
  loupe
  nautilus
  # Extensions
  gvfs-mtp
  gvfs-smb
  nautilus-open-any-terminal
)

paru -S --needed ${packages[@]}

systemctl --user enable --now gnome-keyring-daemon

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal ""

if grep -q "pam_gnome_keyring.so" /etc/pam.d/hyprlock; then
  echo 'Skipping gnome-keyring installation into "/etc/pam.d/hyprlock"...'
else
  echo 'Installing gnome-keyring into "/etc/pam.d/hyprlock"...'
  sudo tee -a /etc/pam.d/hyprlock &> /dev/null << EOF
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
EOF
fi

