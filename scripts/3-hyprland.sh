set -e

packages=(
  # Terminal
  zsh
  nvim
  chezmoi
  # Authentication
  hyprpolkitagent
  # Desktop
  foot
  hypridle
  hyprlock
  hyprpicker
  hyprshot
  tmux
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
  # Applications
  brave-bin
  visual-studio-code-bin
  vlc
  vlc-plugins-all
)

paru -S --needed ${packages[@]}

systemctl --user enable --now hypridle
