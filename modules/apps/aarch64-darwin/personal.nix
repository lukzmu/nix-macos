{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    jrnl
    logseq
    proton-pass
    signal-desktop
    thunderbird
  ];
  homebrew = {
    enable = true;
    casks = [
      "proton-drive" # Not available in Nix packages
      "proton-mail-bridge" # Doesn't work good with MacOS
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Brother iPrint&Scan" = 1193539993;
    };
  };
}
