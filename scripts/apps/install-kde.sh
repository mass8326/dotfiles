set -e

packages=(
  dolphin
  xdg-desktop-portal-gtk
)

paru -S --needed ${packages[@]}
