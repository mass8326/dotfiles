set -e

packages=(
  # Authentication
  kwalletmanager
  kwallet-pam
  # Appearance
  qt5ct
  qt6ct
  kvantum
  breeze-icons
  # Applications
  dolphin
)

paru -S --needed ${packages[@]}

if grep -q "pam_kwallet5.so" /etc/pam.d/hyprlock; then
  echo 'Skipping kwallet installation into "/etc/pam.d/hyprlock"...'
else
  echo 'Installing kwallet into "/etc/pam.d/hyprlock"...'
  sudo tee -a /etc/pam.d/hyprlock &> /dev/null << EOF
auth       optional     pam_kwallet5.so
session    optional     pam_kwallet5.so auto_start force_run
EOF
fi

