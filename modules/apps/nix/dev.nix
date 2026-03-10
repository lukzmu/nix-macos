{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
}
