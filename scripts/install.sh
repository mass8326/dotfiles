official_packages=(
  # Terminal
  zsh
  nvim
  chezmoi
  # Desktop
  hyprland
  hyprlock
  hyprpaper
  hypridle
  waybar
  rofi-wayland
  wezterm
  ttf-liberation
  noto-fonts-emoji
  # Integrations
  wl-clipboard
  xdg-desktop-portal-hyprland
  hyprpolkitagent
  gnome-keyring
  libsecret
  # File Browser
  nautilus
  gvfs-mtp
  gvfs-smb
  # Media
  file-roller
  gnome-disk-utility
  gnome-text-editor
  impression
  loupe
  vlc
  vlc-plugins-all
  # Settings
  blueman
  nwg-displays
  nwg-look
  wireguard-tools
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

aur_packages=(
  brave-bin
  visual-studio-code-bin
)

yay -S --needed ${official_packages[@]} ${aur_packages[@]}

systemctl --user enable --now hypridle
systemctl --user enable --now gnome-keyring-daemon

cd $(mktemp -d)
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
./setup.sh
