# dotfiles

## Linux

```sh
mkdir ~/.local
cd ~/.local
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --verbose mass8326
```

## Windows Registry

Not automatically managed by chezmoi are the registry entries in the `/registry` folder. Installation and updates are done manually.
