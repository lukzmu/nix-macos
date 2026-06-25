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
    controlcenter = {
      BatteryShowPercentage = true;
    };
    CustomUserPreferences = {
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
    };
    dock = {
      autohide = false;
      dashboard-in-overlay = true;
      launchanim = false;
      minimize-to-application = true;
      mouse-over-hilite-stack = true;
      mru-spaces = false;
      orientation = "left";
      scroll-to-open = true;
      show-process-indicators = true;
      show-recents = false;
      tilesize = 32;
      persistent-apps =
        [
          "/Applications/Safari.app"
          "/System/Applications/Calendar.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Reminders.app"
          "/System/Applications/Notes.app"
          "/System/Applications/Messages.app"
        ]
        ++ lib.optionals (has "personal") [
          "/Applications/Nix Apps/Signal.app"
        ]
        ++ lib.optionals (has "dev") [
          "/Applications/Ghostty.app"
          "/Applications/Xcode.app"
        ]
        ++ lib.optionals (has "gaming") [
          "/Applications/Discord.app"
          "/Applications/Battle.net.app"
          "/Applications/CurseForge.app"
          "/Applications/Steam.app"
        ]
        ++ lib.optionals (has "personal") [
          "/Applications/NetNewsWire.app"
        ]
        ++ [
          "/System/Applications/Home.app"
          "/System/Applications/Journal.app"
          "/System/Applications/Music.app"
          "/System/Applications/Podcasts.app"
          "/System/Applications/Photos.app"
        ];
      wvous-br-corner = 1; # Disable new note in corner
    };
    finder = {
      _FXShowPosixPathInTitle = false;
      _FXSortFoldersFirst = true;
      _FXSortFoldersFirstOnDesktop = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
      FXRemoveOldTrashItems = true;
      NewWindowTarget = "Home";
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
    };
    iCal = {
      "first day of week" = "Monday";
      CalendarSidebarShown = true;
    };
    loginwindow = {
      autoLoginUser = null;
      DisableConsoleAccess = true;
      GuestEnabled = false;
      LoginwindowText = "Hello there!";
      PowerOffDisabledWhileLoggedIn = true;
      RestartDisabled = true;
      RestartDisabledWhileLoggedIn = true;
      ShutDownDisabled = false;
      ShutDownDisabledWhileLoggedIn = true;
      SleepDisabled = true;
    };
    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 1; # Always
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = false;
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.swipescrolldirection" = true;
      AppleIconAppearanceTheme = "ClearDark";
      AppleInterfaceStyle = "Dark";
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = false;
      AppleShowAllFiles = true;
      AppleTemperatureUnit = "Celsius";
      InitialKeyRepeat = 15;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSWindowResizeTime = 0.001;
      KeyRepeat = 2;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };
    screencapture = {
      disable-shadow = true;
      location = "~/Pictures/Screenshots";
      type = "png";
    };
    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };
}
