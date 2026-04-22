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
    wezterm
  ];
  homebrew = {
    enable = true;
    taps = [
      "kaushiksrini/parqeye"
    ];
    brews = [
      "kaushiksrini/parqeye/parqeye"
    ];
  };
}
