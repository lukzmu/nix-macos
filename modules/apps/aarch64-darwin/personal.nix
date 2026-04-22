{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    signal-desktop
    thunderbird
  ];
  homebrew = {
    enable = true;
    masApps = {
      "Amphetamine" = 937984704;
      "Brother iPrint&Scan" = 1193539993;
      "HomeCam" = 1292995895;
      "Numbers" = 361304891;
      "Pages" = 361309726;
      "uBlock Origin Lite" = 6745342698;
    };
  };
}
