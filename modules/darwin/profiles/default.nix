{
  lib,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
in {
  imports = lib.optionals (has "personal") [./personal.nix];
}
