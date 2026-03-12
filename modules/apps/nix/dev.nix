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
  ];
}
