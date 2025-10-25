set -e

packages=(
  rofi # Launch programs
  swaync # Display launch errors
)

paru -S --needed ${packages[@]}

cd $(mktemp -d)
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
./setup.sh
