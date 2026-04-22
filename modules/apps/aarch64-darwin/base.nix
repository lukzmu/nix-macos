{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    htop
    m-cli
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
