{pkgs, ...}: {
  homebrew = {
    enable = true;
    casks = [
      "battle-net"
      "curseforge"
      "discord" # nix discord has problems with updates on MacOS
    ];
    masApps = {
      "Cult Of The Lamb" = 1639580858;
      "DREDGE+" = 6753196416;
    };
  };
}
