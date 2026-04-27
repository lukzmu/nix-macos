{
  lib,
  pkgs,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
in {
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
        []
        ++ lib.optionals (has "work") [
          "/Applications/Gemini.app"
          "/Applications/Nix Apps/Google Chrome.app"
          "/Applications/Nix Apps/Slack.app"
          "/Applications/Microsoft Teams.app"
        ]
        ++ lib.optionals (has "dev") [
          "/Applications/Nix Apps/WezTerm.app"
        ];
    };
    finder = {
      _FXShowPosixPathInTitle = false;
      AppleShowAllExtensions = false;
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
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
  };
}
