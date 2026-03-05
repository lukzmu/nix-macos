{
  config,
  pkgs,
  lib,
  username,
  userHome,
  hostName,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
  profileModules =
    (lib.optionals (has "base") [./modules/home/profiles/base.nix])
    ++ (lib.optionals (has "dev") [./modules/home/profiles/dev.nix])
    ++ (lib.optionals (has "desktop") [./modules/home/profiles/desktop.nix])
    ++ (lib.optionals (has "gaming") [./modules/home/profiles/gaming.nix]);
in {
  imports =
    [
      ./modules/home/theme/default.nix
      ./modules/home/programs/default.nix
    ]
    ++ profileModules;

  home.username = username;
  home.homeDirectory = userHome;
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
