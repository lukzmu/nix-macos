{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    obsidian
    signal-desktop
    spotify
    thunderbird
  ];
}
