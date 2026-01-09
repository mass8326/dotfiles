set -eu
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
sh --login <<EOF
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
EOF
