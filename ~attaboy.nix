{ config, pkgs, ... }:

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
    plugins = with pkgs.vimPlugins; [ vim-fugitive vim-surround tabular ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
