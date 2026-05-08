{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fastfetch
    htop
    m-cli
    openfetch
    starship
    tree
    zsh
  ];
  homebrew = {
    enable = true;
    casks = [
      "rectangle"
    ];
    brews = [
      "diskonaut"
      "mas"
    ];
  };
}
