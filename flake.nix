{
  description = "Hyprland flake running on NixOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
  };
  outputs = { nixpkgs, home-manager, stylix, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          home-manager.nixosModules.home-manager
          ./hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
    homeConfigurations = {
      hyprland = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          stylix.homeManagerModules.stylix
          ./hyprland.nix
          ./taskbar.nix
        ];
      };
    };
  };
}
