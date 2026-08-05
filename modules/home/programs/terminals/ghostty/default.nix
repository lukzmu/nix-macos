{
  lib,
  pkgs,
  ...
}: let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;

  linuxConfig = pkgs.runCommand "ghostty-config-linux" {} ''
    grep -v '^macos-' ${./config.ghostty} > "$out"
    cat ${./config-linux.ghostty} >> "$out"
  '';
in {
  home.file."Library/Application Support/com.mitchellh.ghostty/config.ghostty" = lib.mkIf isDarwin {
    source = ./config.ghostty;
  };

  xdg.configFile."ghostty/config" = lib.mkIf (!isDarwin) {
    source = linuxConfig;
  };
}
