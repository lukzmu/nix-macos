{ lib, profiles, ... }:
let
  has = p: lib.elem p profiles;
  bundle = name: [
    ./nix/${name}.nix
    ./brew/${name}.nix
  ];
in
{
  imports =
    (lib.optionals (has "base") (bundle "base"))
    ++ (lib.optionals (has "dev") (bundle "dev"))
    ++ (lib.optionals (has "desktop") (bundle "desktop"))
    ++ (lib.optionals (has "gaming") (bundle "gaming"));
}
