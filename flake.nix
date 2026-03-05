{
  description = "MacOS nix-darwin system configuration by @lukzmu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, agenix, nixvim }:
  let
    lib = nixpkgs.lib;

    mkDarwin = { hostName, system, username, userHome, profiles}:
        nix-darwin.lib.darwinSystem {
            inherit system;
            specialArgs = {
                inherit inputs hostName username userHome profiles;
            };
            modules = [
                ./modules/darwin/core.nix
                ./modules/darwin/system.nix
                ./modules/apps
                ./hosts/${hostName}

                home-manager.darwinModules.home-manager
                {
                    users.users.${username}.home = userHome;
                    home-manager.useGlobalPkgs = true;
                    home-manager.extraSpecialArgs = {
                        inherit inputs hostName username userHome profiles;
                    };
                    home-manager.users.${username} = import ./home.nix;
                }
            ];
        };
  in 
  {
    darwinConfigurations = {
        terra = mkDarwin {
            hostName = "terra";
            system = "aarch64-darwin";
            username = "lukzmu";
            userHome = "/Users/lukzmu";
            profiles = [ "base" "dev" "desktop" "gaming" ];
        };
    };
    darwinPackages = {
        terra = self.darwinConfigurations.terra.pkgs;
    };
  };
}
