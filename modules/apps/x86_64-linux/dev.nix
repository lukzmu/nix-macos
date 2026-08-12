{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker-compose
    ghostty
    lazygit
    mise
    nodejs
    ripgrep
    rustup
    gcc
    gnumake
    pkg-config
  ];
}
