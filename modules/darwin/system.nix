{ pkgs, ... }: {
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
        persistent-apps = [
            "/Applications/Brave Browser.app"
            "/System/Applications/Mail.app"
            "/System/Applications/Calendar.app"
            "/System/Applications/Reminders.app"
            "/System/Applications/Notes.app"
            "/Applications/WezTerm.app"
            { spacer = { small = true; }; }
            "/System/Applications/Messages.app"
            "/Applications/Signal.app"
            "/Applications/Nix Apps/Discord.app"
            { spacer = { small = true; }; }
            "/Applications/Battle.net.app"
            "/Applications/CurseForge.app"
            "/Applications/Warcraft Logs Uploader.app"
            { spacer = { small = true; }; }
            "/System/Applications/Music.app"
            "/System/Applications/Podcasts.app"
            "/System/Applications/Journal.app"
            "/System/Applications/Photos.app"
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
