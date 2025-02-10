{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot = {
    enable = true;
    editor = true;
    consoleMode = "max";
  };

  networking.hostName = "deadpixie";
  networking.wireless.enable = true;

  time.timeZone = "Europe/Zurich";

  i18n = {
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "de_CH.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "th_TH.UTF-8/UTF-8"
      "ko_KR.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_MESSAGES = "en_US.UTF-8";
      LC_TIME = "de_CH.UTF-8";
      LC_MEASUREMENT = "de_CH.UTF-8";
      LC_NUMERIC = "de_CH.UTF-8";
    };
  };

  console = {
    #keyMap = "dvorak-programmer";
    useXkbConfig = true;
  };

  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./dwm;
      };
    };
    xkb = {
      layout = "us";
      variant = "dvp";
      options = "caps:escape;compose:rwin";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      tappingButtonMap = "lrm";
      naturalScrolling = true;
      disableWhileTyping = true;
    };
  };

  users.users.attaboy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
      home-manager
    ];
  };

  programs.firefox.enable = true;
  programs.i3lock.enable = true;
  programs.vim = {
      enable = true;
      defaultEditor = true;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    i3lock
    vim
    wget
    curl
    git
    rsync
    kitty
    dmenu
    atkinson-hyperlegible
  ];

  let
    berkeley-mono-typeface = pkgs.callPackage ./berkeley-mono.nix { inherit pkgs };
  in

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      noto-fonts
      jetbrains-mono
      berkeley-mono-typeface
    ];
  };

  # /run/current-system/configuration.nix
  system.copySystemConfiguration = true;
  system.stateVersion = "24.11"; # don't touch this!
}
