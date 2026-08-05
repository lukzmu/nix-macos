{pkgs, username, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    obsidian
    signal-desktop
    spotify
    thunderbird
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ username ];
  };
}
