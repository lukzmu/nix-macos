{
  lib,
  pkgs,
  ...
}: let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;

  configFile =
    pkgs.writeText "lazygit-config.yml"
    (
      builtins.readFile ./config/config.yml
      + builtins.readFile (
        if isDarwin
        then ./config/os-darwin.yml
        else ./config/os-linux.yml
      )
    );
in {
  home.file."Library/Application Support/lazygit/config.yml" = lib.mkIf isDarwin {
    source = configFile;
  };

  xdg.configFile."lazygit/config.yml" = lib.mkIf (!isDarwin) {
    source = configFile;
  };
}
