{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    google-chrome
    slack
  ];
  homebrew = {
    enable = true;
    casks = [
      "google-gemini"
      "microsoft-teams"
    ];
    masApps = {
      "Amphetamine" = 937984704;
    };
  };
}
