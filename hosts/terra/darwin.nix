{
  lib,
  pkgs,
  profiles,
  ...
}: let
  has = p: lib.elem p profiles;
in {
  security.pam.services.sudo_local.touchIdAuth = true;

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
        [
          "/Applications/Safari.app"
          "/System/Applications/Calendar.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Notes.app"
          "/System/Applications/Messages.app"
        ]
        ++ lib.optionals (has "dev") [
          "/Applications/Ghostty.app"
          "/Applications/Xcode.app"
        ]
        ++ lib.optionals (has "gaming") [
          "/Applications/Discord.app"
          "/Applications/Battle.net.app"
          "/Applications/CurseForge.app"
        ]
        ++ lib.optionals (has "personal") [
          "/Applications/HomeCam.app"
        ]
        ++ [
          "/System/Applications/Home.app"
          "/System/Applications/Photos.app"
          "/System/Applications/Music.app"
          "/System/Applications/Podcasts.app"
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
