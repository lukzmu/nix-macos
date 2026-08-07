{
  username,
  pkgs,
  ...
}: {
  hardware.nvidia-gpu = {
    enable = true;
    open = true;
    branch = "stable";
  };

  hardware.openrazer = {
    enable = true;
    users = [username];
  };

  environment.systemPackages = with pkgs; [
    polychromatic
  ];

  zramSwap.enable = true;
}
