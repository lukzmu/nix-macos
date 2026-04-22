{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bun
    docker-compose
    git
    lazygit
    mise
    neovim
    nodejs
    opencode
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
