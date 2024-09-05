{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./users.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  environment.systemPackages = with pkgs; [
    hyprland
    eww
    rofi-wayland
    kitty
    vim
    git
    firefox
    discord
    steam
    vscode
    p3x-onenote
    spotify
    vlc
    pipewire
    lutris
    waybar
    pulsemixer
    pavucontrol
    godot_4
    wireplumber
    btop
    exfat
    exfatprogs
    ntfs3g
    xfce.thunar
    bottles
  ];
  fonts.packages = with pkgs; [
    nerdfonts
  ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl.enable = true;
    pulseaudio.enable = false;
  };
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
  };
  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;
  services.displayManager = {
    defaultSession = "hyprland";
    sddm.enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };
  services.xserver = {
    enable = true;
    displayManager.session = [
      {
        manage = "desktop";
        name = "hyprland";
        start = ''exec $HOME/.xsession'';
      }
    ];
    videoDrivers = ["nvidia"];
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  system.stateVersion = "24.05";
  time.timeZone = "America/Denver";
}

