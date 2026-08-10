{
  lib,
  system,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
  bundle = name: [
    ./${system}/${name}.nix
  ];
in {
  imports =
    (lib.optionals (has "base") (bundle "base"))
    ++ (lib.optionals (has "dev") (bundle "dev"))
    ++ (lib.optionals (has "personal") (bundle "personal"))
    ++ (lib.optionals (has "gaming") (bundle "gaming"))
    ++ (lib.optionals (has "ai") (bundle "ai"));
}
