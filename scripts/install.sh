packages=(
  # Terminal
  zsh
  nvim
  chezmoi
  # Desktop
  hyprland
  waybar
  rofi-wayland
  wezterm
  # Integrations
  wl-clipboard
  xdg-desktop-portal-hyprland
  hyprpolkitagent
  # File Browser
  nautilus
  gvfs-smb
  # Settings
  blueman
  nwg-displays
  nwg-look
  # Screenshots
  slurp
  grim
  # Nvidia
  nvidia-dkms 
  # Steam
  steam
  lib32-gtk2
  lib32-libva
  lib32-libvdpau
  lib32-nvidia-utils
)

sudo pacman -S ${packages[@]}

cd $(mktemp -d)
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
./setup.sh
