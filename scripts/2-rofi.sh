set -e

packages=(
  rofi
)

paru -S --needed ${packages[@]}

cd $(mktemp -d)
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
./setup.sh
