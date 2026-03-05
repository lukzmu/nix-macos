{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        lazygit
        mise
        neovim
        podman
        ripgrep
        terraform
        terragrunt
    ];
}
