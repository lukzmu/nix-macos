{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker-compose
    ghostty
    lazygit
    mise
    nodejs
    ripgrep
    gcc
    gnumake
  ];
}
