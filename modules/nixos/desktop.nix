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
        adwaita-fonts # gsettings-desktop-schemas defaults the GTK UI font to
                      # "Adwaita Sans"/"Adwaita Mono"; without this package that
                      # name resolves to noto-fonts-cjk-sans, which lacks
                      # precomposed Polish glyphs and breaks diacritics (e.g. ż).
      ];
      fontconfig = {
        defaultFonts = {
          monospace = ["0xProto Nerd Font Mono"];
          sansSerif = ["Inter" "Noto Sans"];
          serif = ["Noto Serif"];
          emoji = ["Noto Color Emoji"];
        };
        localConf = ''
          <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
          <fontconfig>
            <!-- Noto Sans CJK lacks precomposed Latin Extended-A and Latin mark
                 GPOS; it must never satisfy a Latin UI-font request (e.g. the
                 GTK "Adwaita Sans"/"Adwaita Mono" defaults). -->
            <alias binding="strong">
              <family>Adwaita Sans</family>
              <accept><family>Inter</family></accept>
            </alias>
            <alias binding="strong">
              <family>Adwaita Mono</family>
              <accept><family>0xProto Nerd Font Mono</family></accept>
            </alias>
          </fontconfig>
        '';
      };
    };
  }
