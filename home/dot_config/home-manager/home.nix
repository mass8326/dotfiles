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
      docker-credential-helpers
      git-credential-manager
      git-credential-oauth
      nixd
      nixfmt
      statix
    ];
  };
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    fd.enable = true;
    fzf.enable = true;
    git-credential-oauth.enable = true;
    home-manager.enable = true;
    lazygit = {
      enable = true;
      enableZshIntegration = true;
    };
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
