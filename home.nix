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
    ++ (lib.optionals (has "work") [./modules/home/profiles/work.nix])
    ++ (lib.optionals (has "personal") [./modules/home/profiles/personal.nix])
    ++ (lib.optionals (has "gaming") [./modules/home/profiles/gaming.nix])
    ++ (lib.optionals (has "ai") [./modules/home/profiles/ai.nix]);
in {
  imports =
    [
      ./modules/home/programs/default.nix
    ]
    ++ profileModules;

  home.username = username;
  home.homeDirectory = userHome;
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
