# https://home-manager-options.extranix.com
{ pkgs, ... }:
{
  home = {
    username = "mass";
    homeDirectory = "/home/mass";
    stateVersion = "25.11";
    # https://search.nixos.org/packages
    packages = with pkgs; [
      deadnix
      nixd
      nixfmt
      statix
    ];
  };
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
    home-manager = {
      enable = true;
    };
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
