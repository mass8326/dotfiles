# dotfiles

## Linux

```sh
wget https://raw.githubusercontent.com/mass8326/dotfiles/refs/heads/main/scripts/install.sh
cat install.sh

chmod +x install.sh
./install.sh

chezmoi init --apply mass8326
chsh -s /bin/zsh
sudo shutdown -r now
```

## Windows Registry

Not automatically managed by chezmoi are the registry entries in the `/registry` folder. Installation and updates are done manually.
