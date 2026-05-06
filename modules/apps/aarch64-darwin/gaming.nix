{pkgs, ...}: {
  homebrew = {
    enable = true;
    casks = [
      "battle-net"
      "curseforge"
      "discord" # nix discord has problems with updates on MacOS
      "steam"
      "warcraft-logs-uploader"
    ];
  };
}
