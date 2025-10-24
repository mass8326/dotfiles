set -e

packages=(
  # Terminal
  zsh
  nvim
  chezmoi
  # Authentication
  hyprpolkitagent
  # Desktop
  hypridle
  hyprlock
  hyprpicker
  hyprshot
  swaync
  waybar
  wezterm
  wl-clipboard
  xdg-desktop-portal-hyprland
  # Settings
  blueman
  nwg-displays
  wireguard-tools
  # Appearance
  hyprcursor
  hyprpaper
  bibata-cursor-theme-bin
  # Fonts
  ttf-liberation
  noto-fonts-emoji
  # Applications
  brave-bin
  visual-studio-code-bin
  vlc
  vlc-plugins-all
)

paru -S --needed ${packages[@]}

systemctl --user enable --now hypridle
