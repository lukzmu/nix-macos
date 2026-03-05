{
  lib,
  pkgs,
  ...
}: let
  m = lib.getExe pkgs.m-cli;
  wallpaperTarget = "Pictures/Wallpapers/shadow-over-innsmouth.png";
in {
  home.file.${wallpaperTarget}.source = ./wallpaper.png;

  home.activation.setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] ''
    export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

    wallpaper_path="$HOME/${wallpaperTarget}"

    if [ -x ${m} ] && /usr/bin/pgrep -qx Dock; then
      ${m} wallpaper --set "$wallpaper_path" >/dev/null 2>&1 || true
      /usr/bin/osascript \
        -e 'tell application "System Events"' \
        -e 'repeat with d in desktops' \
        -e 'set picture of d to POSIX file "'"$wallpaper_path"'"' \
        -e 'end repeat' \
        -e 'end tell' >/dev/null 2>&1 || true
    fi
  '';
}
