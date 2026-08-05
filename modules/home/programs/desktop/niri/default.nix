{
  lib,
  pkgs,
  ...
}: {
  xdg.configFile."niri/config.kdl".source =
    pkgs.runCommand "niri-config-checked" {
      nativeBuildInputs = [pkgs.niri];
      xwaylandSatellite = lib.getExe pkgs.xwayland-satellite;
    } ''
      export HOME="$(mktemp -d)"
      substitute ${./config.kdl} config.kdl --subst-var xwaylandSatellite
      niri validate --config config.kdl
      cp config.kdl "$out"
    '';
}
