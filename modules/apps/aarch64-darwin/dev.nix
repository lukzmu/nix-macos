{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker-compose
    git
    lazygit
    mise
    neovim
    nodejs
    podman
    ripgrep
    terraform
    terragrunt
  ];
  homebrew = {
    enable = true;
    casks = [
      "ghostty" # Not available in nix darwin
    ];
    taps = [
      "kaushiksrini/parqeye"
    ];
    brews = [
      "kaushiksrini/parqeye/parqeye"
    ];
  };
}
