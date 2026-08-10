{
  description = "NixOS system configuration by @lukzmu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    disko,
  }: let
    lib = nixpkgs.lib;

    defaultFlakeRoot = userHome: "${userHome}/developer/projects/lukzmu/nix-config";

    mkNixos = {
      hostName,
      system,
      username,
      userHome,
      profiles,
      flakeRoot ? defaultFlakeRoot userHome,
    }:
      lib.nixosSystem {
        specialArgs = {
          inherit inputs hostName system username userHome profiles flakeRoot;
        };
        modules = [
          disko.nixosModules.disko
          ./modules/nixos/core.nix
          ./modules/nixos/system.nix
          ./modules/nixos/nvidia.nix
          ./modules/nixos/desktop.nix
          ./modules/apps
          ./hosts/${hostName}

          home-manager.nixosModules.home-manager
          ({pkgs, ...}: {
            users.users.${username} = {
              isNormalUser = true;
              description = "Lukasz Zmudzinski";
              home = userHome;
              shell = pkgs.zsh;
              extraGroups = [
                "wheel"
                "networkmanager"
                "video"
                "input"
                "render"
                "audio"
                "lp"
                "scanner"
                "podman"
              ];
              initialPassword = "changeme";
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit inputs hostName system username userHome profiles flakeRoot;
            };
            home-manager.users.${username} = import ./home.nix;
          })
        ];
      };
  in {
    nixosConfigurations = {
      sol = mkNixos {
        hostName = "sol";
        system = "x86_64-linux";
        username = "lukzmu";
        userHome = "/home/lukzmu";
        profiles = ["base" "dev" "personal" "gaming" "ai" "desktop"];
      };
    };
    nixosPackages = {
      sol = self.nixosConfigurations.sol.pkgs;
    };
  };
}
