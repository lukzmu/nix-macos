{
  lib,
  pkgs,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
in {
  security.pam.services.sudo_local.touchIdAuth = true;

  system.activationScripts.defaultBrowser.text = ''
    ${pkgs.m-cli}/bin/m browser brave || true
  '';

  system.defaults = {
    CustomUserPreferences = {
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
    };
    dock = {
      autohide = false;
      launchanim = false;
      show-process-indicators = true;
      show-recents = false;
      tilesize = 32;
      persistent-apps =
        lib.optionals (has "personal") [
          "/Applications/Nix Apps/Brave Browser.app"
          "/Applications/Nix Apps/Thunderbird.app"
          "/System/Applications/Messages.app"
          "/Applications/Nix Apps/Signal.app"
        ]
        ++ lib.optionals (has "dev") [
          "/Applications/WezTerm.app"
        ]
        ++ lib.optionals (has "gaming") [
          "/Applications/Nix Apps/Discord.app"
          "/Applications/Battle.net.app"
          "/Applications/CurseForge.app"
          "/Applications/Steam.app"
        ];
    };
    finder = {
      _FXShowPosixPathInTitle = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    loginwindow = {
      autoLoginUser = null;
      DisableConsoleAccess = true;
      GuestEnabled = false;
      LoginwindowText = "Hello there!";
    };
    menuExtraClock.Show24Hour = true;
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = false;
      AppleShowAllFiles = true;
      InitialKeyRepeat = 15;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSWindowResizeTime = 0.001;
      KeyRepeat = 2;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
      "com.apple.keyboard.fnState" = false;
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.swipescrolldirection" = true;
    };
    screencapture = {
      location = "~/Pictures/Screenshots";
      type = "png";
      disable-shadow = true;
    };
    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };
}
