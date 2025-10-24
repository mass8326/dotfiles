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

if grep -q "pam_kwallet5.so" /etc/pam.d/greetd; then
  echo 'Skipping kwallet installation into "/etc/pam.d/greetd"...'
else
  echo 'Installing kwallet into "/etc/pam.d/greetd"...'
  sudo tee -a /etc/pam.d/greetd &> /dev/null << EOF
auth       optional     pam_kwallet5.so
session    optional     pam_kwallet5.so auto_start force_run
EOF
fi

