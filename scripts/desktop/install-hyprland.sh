set -e

packages=(
  # Authentication
  hyprpolkitagent
  # Desktop
  rofi
  swaync
  uwsm
  hyprland
  hypridle
  hyprlock
  hyprpicker
  hyprshot
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

systemctl --user enable --now hypridle

(
  cd $(mktemp -d)
  git clone --depth=1 https://github.com/adi1090x/rofi.git
  cd rofi
  ./setup.sh
)
