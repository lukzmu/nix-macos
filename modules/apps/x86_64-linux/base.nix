{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fastfetch
    htop
    onefetch
    tree

    # Required by the niri desktop session.
    adwaita-icon-theme
    brightnessctl
    grim
    libnotify
    nautilus
    pavucontrol
    playerctl
    slurp
    wl-clipboard
    xwayland-satellite
  ];
}
