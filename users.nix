{ config, pkgs, ... }:
{
  users.users.hypr = {
    isNormalUser = true;
    home = "/home/hypr";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "audio" ];
  };
}
