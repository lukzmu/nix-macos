{
  security.pam.services.sudo_local.touchIdAuth = true;
  system = {
    defaults = {
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
        AppleShowAllExtensions = true;
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
    stateVersion = 6;
  };
}
