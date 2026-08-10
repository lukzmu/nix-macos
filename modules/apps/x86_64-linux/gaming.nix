{pkgs, ...}: {
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    discord
    heroic
    wowup-cf
  ];
}
