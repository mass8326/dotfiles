set -e

packages=(
  # Necessities
  kscreen
  kwin
  plasma-desktop
  # Appearance
  breeze-icons
  kvantum
  qt5ct
  qt6ct
)

paru -S --needed ${packages[@]}

kwriteconfig6 --file kwalletrc --group 'Wallet' --key 'Enabled' 'false'
