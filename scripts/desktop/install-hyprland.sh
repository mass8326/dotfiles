set -e

packages=(
  # Authentication
  hyprpolkitagent
  # Desktop
  uwsm
  hyprland
  hyprpicker
  hyprshot
  noctalia
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
  matugen
  bibata-cursor-theme-bin
  # Fonts
  adobe-source-code-pro-fonts
  adobe-source-sans-fonts
  adobe-source-serif-fonts
  noto-fonts
  noto-fonts-emoji
  otf-commit-mono-nerd
  ttf-caladea
  ttf-carlito
  ttf-dejavu
  ttf-liberation
  ttf-roboto
  ttf-ubuntu-font-family
)

paru -S --needed ${packages[@]}

systemctl --user enable --now hyprpolkitagent

