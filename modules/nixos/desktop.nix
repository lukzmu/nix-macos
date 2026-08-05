{
  lib,
  pkgs,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
in
  lib.mkIf (has "desktop") {
    programs.niri.enable = true;
    programs.dms-shell.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${lib.getExe pkgs.tuigreet} --time --remember --asterisks --cmd niri-session";
        user = "greeter";
      };
    };
    systemd.services.greetd.serviceConfig.Type = "idle";
    security.pam.services.greetd.enableGnomeKeyring = true;

    services.gvfs.enable = true;
    services.udisks2.enable = true;
    services.upower.enable = true;

    xdg.portal.xdgOpenUsePortal = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };

    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts._0xproto
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        material-symbols
        inter
      ];
      fontconfig.defaultFonts = {
        monospace = ["0xProto Nerd Font Mono"];
        sansSerif = ["Inter" "Noto Sans"];
        serif = ["Noto Serif"];
        emoji = ["Noto Color Emoji"];
      };
    };
  }
