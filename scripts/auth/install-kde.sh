set -e

packages=(
  kwallet
  kwallet-pam
  kwalletmanager
)

paru -S --needed ${packages[@]}

kwriteconfig6 --file kwalletrc --group 'Wallet' --key 'Enabled' 'false'

pam_module="greetd"
if grep -q "pam_kwallet5.so" "/etc/pam.d/$pam_module"; then
  echo "Skipping kwallet installation into '/etc/pam.d/$pam_module'..."
else
  echo "Installing kwallet into '/etc/pam.d/$pam_module'..."
  sudo tee -a "/etc/pam.d/$pam_module" &> /dev/null << EOF
auth       optional     pam_kwallet5.so
session    optional     pam_kwallet5.so auto_start force_run
EOF
fi
