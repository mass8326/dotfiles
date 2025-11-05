set -e

packages=(
  steam
  lib32-gtk2
  lib32-libva
  lib32-libvdpau
  lib32-nvidia-utils
  nvidia-dkms
)

paru -S --needed ${packages[@]}
