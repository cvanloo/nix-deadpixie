{ config, pkgs, ... }:

let
  vim-simple-dark = import ./vim-simple-dark.nix { inherit pkgs; };
in
{
  home.username = "attaboy";
  home.homeDirectory = "/home/attaboy";

  home.packages = with pkgs; [
    htop
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [ vim-fugitive vim-surround tabular vim-simple-dark ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
